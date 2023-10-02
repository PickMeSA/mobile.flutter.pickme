import 'dart:async';

import 'package:app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../models/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.chatUser, required this.currentUser}) : super(key: key);
  final UserModel chatUser;
  final UserModel currentUser;

  @override
  State<ChatScreen> createState() => _ChatScreenState(chatUser, currentUser);
}

class _ChatScreenState extends State<ChatScreen> {
  final UserModel chatUser;
  final UserModel currentUser;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  var chatDocId;

  TextEditingController _messageController = TextEditingController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Messages');

  void sendMessage(String msg) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (msg == '') return;
    await messages.doc(chatDocId).update({
      'lastMessage': _messageController.text.trim(),
      'lastMessageDate': FieldValue.serverTimestamp(),
    });
    await messages.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'msg': msg,
    }).then((value) => _messageController.clear());
    messages.doc(chatDocId).update({
      'usersUnread.${chatUser.uid}': FieldValue.increment(1),
    });
  }

  _ChatScreenState(this.chatUser, this.currentUser);

  @override
  void initState() {
    super.initState();
    messages
        .where('userIds', arrayContainsAny: [currentUserId, chatUser.uid])
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            setState(() {
              chatDocId = querySnapshot.docs.single.id;
            });
            messages.doc(chatDocId).update({
              'usersUnread.$currentUserId': 0,
            });
          } else {
            messages.add({
              'userIds': [chatUser.uid, currentUserId],
              'usersUnread': {
                currentUserId: 0,
                chatUser.uid: 0,
              },
              'users': {
                currentUserId: currentUser.toChatUserMap(),
                chatUser.uid: chatUser.toChatUserMap(),
              },
            }).then((value) {
              setState(() {
                chatDocId = value.id;
              });
            });
          }
        })
        .catchError((error) {
          print(error);
        });
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(chatUser.fullName!),
            ),
            body: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Messages')
                        .doc(chatDocId)
                        .collection('messages')
                        .orderBy('createdOn', descending: true)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            reverse: true,
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              data = document.data();
                              return Align(
                                alignment: data['uid'].toString() == currentUserId ? Alignment.centerRight : Alignment.centerLeft,
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: data['uid'].toString() == currentUserId ? null : Palette.mediumGrey,
                                    gradient: data['uid'].toString() == currentUserId ? Palette.greenGradient : null,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: const Radius.circular(12),
                                      topLeft: Radius.circular(data['uid'].toString() == currentUserId ? 12 : 0),
                                      topRight: Radius.circular(data['uid'].toString() == currentUserId ? 0 : 12),
                                      bottomRight: const Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data['msg'],
                                            style: TextStyle(
                                              color: data['uid'].toString() == currentUserId ? Colors.white : Colors.black,
                                            ),
                                          ),
                                        ),
                                        if (data['createdOn'] != null)
                                          Text(
                                            DateFormat.Hm().format(data['createdOn'].toDate()),
                                            style: TextStyle(
                                              color: data['uid'].toString() == currentUserId ? Colors.white : Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Message...',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (_messageController.text.isNotEmpty) {
                            sendMessage(_messageController.text.trim());
                          }
                        },
                        child: CircleAvatar(
                          radius: 25,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(shape: BoxShape.circle, gradient: Palette.greenGradient),
                            child: Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
