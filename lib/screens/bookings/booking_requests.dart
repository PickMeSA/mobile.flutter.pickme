import 'dart:developer';

import 'package:app/main.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/webview_screen.dart';
import 'package:app/widgets/booking_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../models/booking_model.dart';
import '../../services/push_service.dart';
import '../../widgets/buttons.dart';
import '../chat/chat_screen.dart';
import 'booking_review.dart';

class BookingRequestsListScreen extends StatefulWidget {
  @override
  State<BookingRequestsListScreen> createState() =>
      _BookingRequestsListScreenState();
}

class _BookingRequestsListScreenState extends State<BookingRequestsListScreen> {
  final authUser = FirebaseAuth.instance.currentUser!;

  late final UserModel user;

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(authUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        if (mounted) {
          setState(() {
            user = UserModel.customerFromMap(snapshot);
            isLoading = false;
          });
        }
      }
    });
  }

  final reviewFocusNode = FocusNode();
  bool isLoading = true;

  Stream<List<BookingModel>> getBookingRequestsListLabourer() =>
      FirebaseFirestore.instance
          .collection('Bookings')
          .where('labourer.uid', isEqualTo: authUser.uid)
          .where('status', isEqualTo: 'request')
          .orderBy('date')
          .orderBy('startTime')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => BookingModel.fromMap(doc.data()))
              .toList());

  Stream<List<BookingModel>> getBookingRequestsListCustomer() =>
      FirebaseFirestore.instance
          .collection('Bookings')
          .where('customer.uid', isEqualTo: authUser.uid)
          .where('status', whereIn: ['request', 'confirmed'])
          .orderBy('date')
          .orderBy('startTime')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => BookingModel.fromMap(doc.data()))
              .toList());

  Stream<List<BookingModel>> getConfirmedBookingsList() =>
      FirebaseFirestore.instance
          .collection('Bookings')
          .where('customer.uid', isEqualTo: authUser.uid)
          .where('status', isEqualTo: 'confirmed')
          .orderBy('date')
          .orderBy('startTime')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => BookingModel.fromMap(doc.data()))
              .toList());

  // BUILD BOOKING
  Widget buildBooking(BookingModel booking) {
    return BookingListItem(
        userRole: user.userRole!,
        bookingModel: booking,
        onCancel: () {
          showCancelModal(context, booking);
        },
        onPay: () {
          log('ID: ${booking.id}');
          log('Amount: ${booking.amount}');
          log('https://pickme.mont6.co.za/api/payfast/checkout/booking/${booking.id}/${booking.amount.toString()}/${user.email}');
          Navigator.push(
            context,
            MaterialPageRoute(
              // builder: (context) => LabourerProfileScreen(labourer: user),
              builder: (context) => WebViewScreen(
                url:
                    'https://pickme.mont6.co.za/api/payfast/checkout/booking/${booking.id}/${booking.amount.toString()}/${user.email}',
                customer: user,
                labourer: booking.labourer!['pushToken'],
                bookingId: booking.id!,
              ),
            ),
          );
        },
        onMarkComplete: () {},
        onReschedule: () {},
        onRate: () {},
        onAccept: () {
          showAcceptModal(context, booking);
        },
        onReject: () {
          showRejectModal(context, booking);
        },
        onChat: () {
          UserModel chatUser = UserModel(
            uid: user.userRole == 'customer'
                ? booking.labourer!['uid']
                : booking.customer!['uid'],
            fullName: user.userRole == 'customer'
                ? booking.labourer!['fullName']
                : booking.customer!['fullName'],
            profileImage: user.userRole == 'customer'
                ? booking.labourer!['profileImage']
                : booking.customer!['profileImage'],
          );
          UserModel currentUser = UserModel(
            uid: user.userRole == 'customer'
                ? booking.customer!['uid']
                : booking.labourer!['uid'],
            fullName: user.userRole == 'customer'
                ? booking.customer!['fullName']
                : booking.labourer!['fullName'],
            profileImage: user.userRole == 'customer'
                ? booking.customer!['profileImage']
                : booking.labourer!['profileImage'],
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ChatScreen(
                chatUser: chatUser,
                currentUser: currentUser,
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _getUserFromDatabase();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Booking Requests'),
        ),
        body: isLoading
            ? Center(
                child: spinLoader,
              )
            : StreamBuilder<List<BookingModel>>(
                stream: user.userRole == 'labourer'
                    ? getBookingRequestsListLabourer()
                    : getBookingRequestsListCustomer(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'There was an error connecting to the server. Please try again later.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final bookings = snapshot.data;
                    if (bookings!.isEmpty) {
                      return Center(
                          child: notFound(
                              message: 'You have no booking requests.'));
                    }
                    return ListView(
                      children: bookings.map(buildBooking).toList(),
                    );
                  } else {
                    return Center(
                      child: spinLoader,
                    );
                  }
                },
              ),
      ),
    );
  }

  Future<dynamic> showAcceptModal(BuildContext context, BookingModel booking) {
    acceptBooking() async {
      try {
        await FirebaseFirestore.instance
            .collection("Bookings")
            .doc(booking.id)
            .update({
          'status': 'confirmed',
        });
        if (booking.customer!['pushToken'] != null) {
          sendNotificationToPlayer(
              booking.customer!['pushToken'],
              'Booking Request Accepted',
              '${user.fullName} has accepted your booking request');
        } else {
          log('no token');
        }
        navigatorKey.currentState!.pop();
      } catch (e) {
        log(e.toString());
      }
    }

    rejectBooking() async {
      try {
        await FirebaseFirestore.instance
            .collection("Bookings")
            .doc(booking.id)
            .update({
          'status': 'rejected',
        });
        if (booking.customer!['pushToken'] != null) {
          sendNotificationToPlayer(
              booking.customer!['pushToken'],
              'Booking Request Rejected',
              '${user.fullName} has rejected your booking request');
        } else {
          log('no token');
        }
        navigatorKey.currentState!.pop();
      } catch (e) {
        print(e);
      }
    }

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Accept Booking',
              style: TextStyle(
                  color: Palette.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Are you sure you want to accept this service booking?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                '',
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: smallLightGreenButton(label: 'No'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        acceptBooking();
                      },
                      child: smallGreenButton(label: 'Yes')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showRejectModal(BuildContext context, BookingModel booking) {
    rejectBooking() async {
      try {
        await FirebaseFirestore.instance
            .collection("Bookings")
            .doc(booking.id)
            .update({
          'status': 'rejected',
        });
        navigatorKey.currentState!.pop();
      } catch (e) {
        print(e);
      }
    }

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Reject Booking',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Are you sure you want to reject this service booking?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                '',
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: smallLightGreenButton(label: 'No'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        rejectBooking();
                      },
                      child: smallGreenButton(label: 'Yes')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget notFound({required String message}) {
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
                    'Not Found',
                    style: kHeadingTextStyle,
                  ),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> showCancelModal(BuildContext context, BookingModel booking) {
    cancelBooking() async {
      try {
        await FirebaseFirestore.instance
            .collection("Bookings")
            .doc(booking.id)
            .update({
          'status': 'cancelled',
        });
        navigatorKey.currentState!.pop();
      } catch (e) {
        print(e);
      }
    }

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Cancel Booking',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'Are you sure you want to cancel your service booking?',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: smallLightGreenButton(label: 'No'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              cancelBooking();
                            },
                            child: smallGreenButton(label: 'Yes')),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
