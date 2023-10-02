import 'package:app/main.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/bookings/booking_requests.dart';
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
import '../../widgets/buttons.dart';
import '../chat/chat_screen.dart';
import 'booking_review.dart';

class BookingsScreen extends StatefulWidget {
  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final authUser = FirebaseAuth.instance.currentUser!;

  late final UserModel user;

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance.collection("Users").doc(authUser.uid).get().then((snapshot) async {
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

  TextEditingController _reviewController = TextEditingController();
  final reviewFocusNode = FocusNode();
  double rating = 0;
  bool isLoading = true;

  // GET BOOKING LISTS
  Stream<List<BookingModel>> getUpcomingList() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('customer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'upcoming')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getCompletedList() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('customer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'completed')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getCancelledList() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('customer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'cancelled')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getUpcomingListLabourer() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('labourer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'upcoming')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getCompletedListLabourer() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('labourer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'completed')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getCancelledListLabourer() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('labourer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'cancelled')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  Stream<List<BookingModel>> getNewBookingsListLabourer() => FirebaseFirestore.instance
      .collection('Bookings')
      .where('labourer.uid', isEqualTo: authUser.uid)
      .where('status', isEqualTo: 'request')
      .orderBy('date')
      .orderBy('startTime')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => BookingModel.fromMap(doc.data())).toList());

  // BUILD BOOKING
  Widget buildBooking(BookingModel booking) {
    return BookingListItem(
        userRole: user.userRole!,
        bookingModel: booking,
        onCancel: () {
          showCancelModal(context, booking);
        },
        onMarkComplete: () {
          showMarkCompleteModal(context, booking);
        },
        onReschedule: () {
          showRescheduleModal(context, booking);
        },
        onRate: () {
          showRateWorkerModal(context, booking);
        },
        onChat: () {
          UserModel chatUser = UserModel(
            uid: user.userRole == 'customer' ? booking.labourer!['uid'] : booking.customer!['uid'],
            fullName: user.userRole == 'customer' ? booking.labourer!['fullName'] : booking.customer!['fullName'],
            profileImage: user.userRole == 'customer' ? booking.labourer!['profileImage'] : booking.customer!['profileImage'],
          );
          UserModel currentUser = UserModel(
            uid: user.userRole == 'customer' ? booking.customer!['uid'] : booking.labourer!['uid'],
            fullName: user.userRole == 'customer' ? booking.customer!['fullName'] : booking.labourer!['fullName'],
            profileImage: user.userRole == 'customer' ? booking.customer!['profileImage'] : booking.labourer!['profileImage'],
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
    _reviewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset('assets/images/logo_small.png'),
            ),
            title: const Text('My Bookings'),
            actions: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingRequestsListScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Palette.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('Requests',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
            ],
            bottom: const TabBar(
              labelColor: Palette.green,
              indicatorWeight: 3,
              unselectedLabelColor: Palette.darkGrey,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ],
            ),
          ),
          body: isLoading
              ? Center(
                  child: spinLoader,
                )
              : TabBarView(
                  children: [
                    StreamBuilder<List<BookingModel>>(
                      stream: user.userRole == 'labourer' ? getUpcomingListLabourer() : getUpcomingList(),
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
                            return notFound(message: 'You have no upcoming bookings.');
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
                    StreamBuilder<List<BookingModel>>(
                      stream: user.userRole == 'labourer' ? getCompletedListLabourer() : getCompletedList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error.toString());
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
                            return notFound(message: 'You have no completed bookings.');
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
                    StreamBuilder<List<BookingModel>>(
                      stream: user.userRole == 'labourer' ? getCancelledListLabourer() : getCancelledList(),
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
                            return notFound(message: 'You have no cancelled bookings.');
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
                  ],
                ),
        ),
      ),
    );
  }

  Future<dynamic> showCancelModal(BuildContext context, BookingModel booking) {
    cancelBooking() async {
      try {
        await FirebaseFirestore.instance.collection("Bookings").doc(booking.id).update({
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
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Cancel Booking',
                    style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'Are you sure you want to cancel your service booking?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'Only 80% of the money you can refund from your payment according to our policy',
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

  Future<dynamic> showRescheduleModal(BuildContext context, BookingModel booking) {
    DateTime bookingDate = booking.date!;
    TimeOfDay startTime = TimeOfDay(
      hour: int.parse(booking.startTime!.substring(0, 2)),
      minute: int.parse(booking.startTime!.substring(3, 5)),
    );
    int workingHours = booking.duration!;

    calcEndTime(TimeOfDay startTime, int duration) {
      TimeOfDay endTime = TimeOfDay(hour: startTime.hour + duration, minute: startTime.minute);
      return endTime;
    }

    rescheduleBooking() async {
      try {
        await FirebaseFirestore.instance.collection("Bookings").doc(booking.id).update({
          'date': bookingDate,
          'startTime': startTime.format(context),
          'endTime': calcEndTime(startTime, workingHours).format(context),
        });
        navigatorKey.currentState!.pop();
      } catch (e) {
        print(e);
      }
    }

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => StatefulBuilder(builder: (BuildContext context, StateSetter setModalState) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Reschedule Booking',
                          style: TextStyle(color: Palette.green, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Date',
                          ),
                          Text(
                            'Time',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context, initialDate: bookingDate, firstDate: DateTime(2022), lastDate: DateTime(2024));
                            if (newDate == null) return;
                            setModalState(() => bookingDate = newDate);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Palette.brightGreen,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.today_outlined,
                                  color: Palette.green,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  DateFormat('MMM d, yyyy').format(bookingDate),
                                  style: kHeadingTextStyle.copyWith(color: Palette.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            TimeOfDay? newTime = await showTimePicker(
                              context: context,
                              initialTime: startTime,
                            );
                            if (newTime == null) return;
                            setModalState(() {
                              startTime = newTime;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Palette.brightGreen,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: Palette.green,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  startTime.format(context),
                                  style: kHeadingTextStyle.copyWith(color: Palette.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     const Expanded(
                    //       child: Text(
                    //         'Working Hours',
                    //         style: kHeadingTextStyle,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //         onTap: () {
                    //           if (workingHours > 1) {
                    //             setModalState(() {
                    //               workingHours--;
                    //             });
                    //           }
                    //         },
                    //         child: smallButton(label: '-', color: Palette.brightGreen, textColor: Palette.green)),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text(
                    //         workingHours.toString(),
                    //         style: const TextStyle(fontWeight: FontWeight.w600),
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         setModalState(() {
                    //           workingHours++;
                    //         });
                    //       },
                    //       child: smallButton(label: '+', color: Palette.brightGreen, textColor: Palette.green),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: smallLightGreenButton(label: 'Cancel'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                rescheduleBooking();
                              },
                              child: smallGreenButton(label: 'Reschedule')),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }

  Future<dynamic> showRateWorkerModal(BuildContext context, BookingModel booking) async {
    UserModel labourer = UserModel.fromMap(booking.labourer);
    late int newNumberOfReviews;
    late num newOverallRating;

    getUserFromDatabase() async {
      await FirebaseFirestore.instance.collection("Users").doc(booking.labourer!["uid"]).get().then((snapshot) {
        if (snapshot.exists) {
          labourer = UserModel.fromMap(snapshot);
          setState(() {
            newNumberOfReviews = labourer.numberOfReviews! + 1;
          });
        }
      });
    }

    await getUserFromDatabase();

    Future<void> submitReview() async {
      if (_reviewController.text.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: spinLoader,
          ),
        );
        try {
          newOverallRating = labourer.overallRating! + rating;

          final reviewDoc = FirebaseFirestore.instance.collection('Reviews').doc();
          final labourerDoc = FirebaseFirestore.instance.collection('Users').doc(labourer.uid);
          final bookingDoc = FirebaseFirestore.instance.collection('Bookings').doc(booking.id);

          await reviewDoc.set({
            'id': reviewDoc.id,
            'date': DateTime.now(),
            'labourer': labourer.uid,
            'customer': user.toMap(),
            'details': _reviewController.text.trim(),
            'rating': rating,
          });

          await labourerDoc.update({
            'numberOfReviews': newNumberOfReviews,
            'overallRating': newOverallRating,
          });

          await bookingDoc.update({
            'reviewed': true,
          });

          navigatorKey.currentState!.pop();
        } catch (e) {
          Utils.showSnackBar(text: e.toString());
          print(e);
        }
        navigatorKey.currentState!.pop();
      } else {
        Utils.showSnackBar(text: 'Please write your review', color: Colors.red);
      }
    }

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => StatefulBuilder(builder: (BuildContext context, StateSetter setModalState) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  reviewFocusNode.unfocus();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text('Rate Worker'),
                    ),
                    body: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          const Text(
                            'Write your review',
                            style: kHeadingTextStyle,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _reviewController,
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: reviewFocusNode,
                            decoration: kTextFieldDecoration.copyWith(hintText: 'Write your review here'),
                            maxLines: 5,
                            validator: (val) {
                              return val!.isEmpty ? 'Please enter Email' : null;
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text('Overall satisfaction with worker'),
                          Row(
                            children: [
                              RatingBar.builder(
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star_rounded,
                                  color: Palette.yellow,
                                ),
                                onRatingUpdate: (newRating) {
                                  setModalState(() {
                                    rating = newRating;
                                  });
                                },
                                unratedColor: Palette.orange.withOpacity(0.25),
                                allowHalfRating: true,
                                glow: false,
                                updateOnDrag: true,
                                maxRating: 5,
                              ),
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '${rating.toStringAsFixed(rating.truncateToDouble() == rating ? 0 : 1)} / 5',
                                  style: kHeadingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      rating = 0;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: smallLightGreenButton(label: 'Cancel'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      submitReview();
                                    },
                                    child: smallGreenButton(label: 'Submit')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  Future<dynamic> showMarkCompleteModal(BuildContext context, BookingModel booking) {
    markCompleteBooking() async {
      try {
        await FirebaseFirestore.instance.collection("Bookings").doc(booking.id).update({
          'status': 'completed',
        });
        navigatorKey.currentState!.pop();
      } catch (e) {
        print(e);
      }
    }

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Complete Booking',
                    style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'Is the job done?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'The customer will be notified that you are done.',
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
                              markCompleteBooking();
                            },
                            child: smallGreenButton(label: 'Yes')),
                      ),
                    ],
                  ),
                ],
              ),
            ));
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
}
