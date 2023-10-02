import 'dart:convert';

import 'package:app/models/user_model.dart';
import 'package:app/widgets/booking_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../models/message_thread_model.dart';
import '../../widgets/buttons.dart';
import 'chat_screen.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  late final UserModel currentUser;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference messages = FirebaseFirestore.instance.collection('Messages');
  bool isLoading = true;

  // GET MESSAGE THREAD LISTS
  Stream getMessageThreadList() {
    return FirebaseFirestore.instance
        .collection('Messages')
        .where('userIds', arrayContains: currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()));
  }

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((snapshot) async {
      if (snapshot.exists) {
        currentUser = UserModel.chatUserFromMap({
          'uid': snapshot.data()!["uid"],
          'fullName': snapshot.data()!["fullName"],
          'profileImage': snapshot.data()!["profileImage"],
        });
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    var data;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/images/logo_small.png'),
            ),
            title: const Text('Inbox'),
            // actions: [
            //   GestureDetector(
            //     child: SvgPicture.asset('assets/icons/search.svg'),
            //   ),
            //   const SizedBox(width: 20),
            // ],
          ),
          body: isLoading
              ? Center(
                  child: spinLoader,
                )
              : StreamBuilder(
                  stream: getMessageThreadList(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Unable to communicate with server"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: spinLoader,
                      );
                    }
                    if (snapshot.hasData) {
                      if (snapshot.data!.length == 0) {
                        return const Center(
                          child: Text('No messages found'),
                        );
                      }
                      List documentSnapshot = snapshot.data.toList();
                      return ListView.builder(
                        itemCount: documentSnapshot.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map chatUser = documentSnapshot[index]['users'];
                          chatUser.removeWhere((key, value) => key == currentUserId);
                          String firstKey = chatUser.keys.first;
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              UserModel chatUserForThread = UserModel(
                                uid: chatUser[firstKey]['uid'].toString(),
                                fullName: chatUser[firstKey]['fullName'].toString(),
                                profileImage: chatUser[firstKey]['profileImage'].toString(),
                              );
                              UserModel currentUserForThread = UserModel(
                                uid: currentUser.uid,
                                fullName: currentUser.fullName,
                                profileImage: currentUser.profileImage,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => ChatScreen(
                                    chatUser: chatUserForThread,
                                    currentUser: currentUserForThread,
                                  ),
                                ),
                              );
                            },
                            child: chatThread(
                                name: chatUser[firstKey]['fullName'].toString(),
                                profileImage: chatUser[firstKey]['profileImage'].toString(),
                                lastMessage: documentSnapshot[index]['lastMessage'],
                                lastMessageDate: documentSnapshot[index]['lastMessageDate']?.toDate(),
                                unreadCount: documentSnapshot[index]['usersUnread'][currentUserId]),
                          );
                          //return Text(chatUser[firstKey]['fullName'].toString());
                        },
                      );
                    }
                    return Text('??');
                  },
                ),
        ),
      ),
    );
  }

  Widget notFound() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Image.asset(
                    'assets/images/notfound.png',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'You have no Messages',
                    style: kHeadingTextStyle,
                  ),
                ),
                const Text(
                  'Chat with someone from the Bookings screen',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget chatThread({
    required String name,
    required String profileImage,
    String? lastMessage,
    DateTime? lastMessageDate,
    required int unreadCount,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        children: [
          profileImage == null || profileImage == ""
              ? CircleAvatar(
                  radius: 30,
                  backgroundColor: Palette.grey.withOpacity(0.5),
                  child: const Icon(
                    Icons.person,
                    color: Palette.grey,
                    size: 35,
                  ),
                )
              : CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(profileImage),
                ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (lastMessage != null) const SizedBox(height: 5),
                if (lastMessage != null)
                  Text(
                    lastMessage,
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 18),
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  color: unreadCount != 0 ? Palette.green : Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  unreadCount.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              if (lastMessageDate != null)
                Text(
                  calcTimeAgo(messageDate: lastMessageDate),
                  style: TextStyle(color: Palette.darkGrey, fontSize: 12),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String calcTimeAgo({required DateTime messageDate}) {
    String displayTime = '';
    // String today = DateFormat.yMMMd().format(DateTime.now());

    final aDate = DateTime(messageDate.year, messageDate.month, messageDate.day);

    final today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final yesterday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

    if (aDate == today) {
      displayTime = DateFormat.Hm().format(messageDate);
    } else if (aDate == yesterday) {
      displayTime = 'Yesterday';
    } else {
      displayTime = DateFormat.yMMMd().format(messageDate);
    }

    return displayTime;
  }
}
