import 'dart:developer';

import 'package:app/components/constants.dart';
import 'package:app/models/review_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/bookings/booking_details_screen.dart';
import 'package:app/services/push_service.dart';
import 'package:app/widgets/buttons.dart';
import 'package:app/widgets/dialogs.dart';
import 'package:app/widgets/review_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../../components/palette.dart';

class LabourerProfileScreen extends StatefulWidget {
  LabourerProfileScreen({
    Key? key,
    required this.labourer,
    required this.customerName,
  }) : super(key: key);

  final UserModel labourer;
  final String customerName;

  @override
  State<LabourerProfileScreen> createState() => _LabourerProfileScreenState();
}

class _LabourerProfileScreenState extends State<LabourerProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  String customerName = '';

  // GET REVIEWS LISTS
  Stream<List<ReviewModel>> getReviewStream() => FirebaseFirestore.instance
      .collection('Reviews')
      .where('labourer', isEqualTo: widget.labourer.uid)
      .orderBy('date')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ReviewModel.fromMap(doc.data())).toList());

  // BUILD REVIEW
  Widget buildReview(ReviewModel review) {
    return ReviewListItem(
      review: review,
    );
  }

  List<ReviewModel> reviewList = [];

  Future getReviewList() async {
    var data = await FirebaseFirestore.instance
        .collection('Reviews')
        .where('labourer', isEqualTo: widget.labourer.uid)
        .orderBy('date')
        .get();
    setState(() {
      reviewList = List.from(data.docs.map((doc) => ReviewModel.fromMap(doc)));
    });
  }

  Widget reviewListWidget(context) {
    if (reviewList.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text('User has not been reviewed.'),
      );
    }
    return Column(
      children: List.generate(
        reviewList.length,
        (index) {
          return buildReview(reviewList[index]);
        },
      ),
    );
  }

  Widget filterButton(String value, String label, Color color) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  Widget imageGallery(context) {
    if (widget.labourer.imageGallery != null &&
        widget.labourer.imageGallery!.isNotEmpty) {
      List imageList = widget.labourer.imageGallery!.toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Image Gallery',
            style: kHeadingTextStyle,
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            runSpacing: 5,
            children: List.generate(imageList.length, (index) {
              return GestureDetector(
                onTap: () {
                  showImageDialog(context, imageList[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageList[index],
                    ),
                  )),
                  width: 125,
                  height: 100,
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> showImageDialog(context, String image) async {
    return showDialog<void>(
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(image),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Palette.green,
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      context: context,
    );
  }

  bool sendingEmail = false;

  @override
  void initState() {
    super.initState();
    customerName = widget.customerName;
    getReviewList();
  }

  @override
  Widget build(BuildContext context) {
    num overallRating = widget.labourer.overallRating! /
        widget.labourer.numberOfReviews!.toDouble();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              widget.labourer.tagline != '' && widget.labourer.tagline != null
                  ? widget.labourer.tagline!
                  : ''),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Palette.mediumGrey),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            widget.labourer.labourerType == 'individual'
                                ? filterButton(
                                    'individuals', 'Individual', Palette.green)
                                : filterButton(
                                    'business', 'Business', Colors.blue),
                          ],
                        ),
                        Row(
                          children: [
                            widget.labourer.profileImage == null ||
                                    widget.labourer.profileImage == ""
                                ? CircleAvatar(
                                    radius: 24,
                                    backgroundColor:
                                        Palette.grey.withOpacity(0.5),
                                    child: const Icon(
                                      Icons.person,
                                      color: Palette.grey,
                                      size: 30,
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        widget.labourer.profileImage!),
                                    radius: 24,
                                  ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: Text(
                              widget.labourer.fullName!,
                              style: const TextStyle(
                                color: Palette.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                            const Icon(
                              Icons.star_rounded,
                              color: Palette.yellow,
                              size: 14,
                            ),
                            Text(
                              ' ${overallRating.isNaN ? '0' : overallRating.toStringAsFixed(overallRating.truncateToDouble() == overallRating ? 0 : 1)} (${widget.labourer.numberOfReviews ?? '0'} reviews)',
                              style: const TextStyle(
                                color: Palette.darkGrey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        if (widget.labourer.serviceCategories != null)
                          const SizedBox(height: 10),
                        if (widget.labourer.serviceCategories != null)
                          SizedBox(
                            height: 24,
                            child: ListView.builder(
                                itemCount:
                                    widget.labourer.serviceCategories?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Palette.green.withOpacity(0.1),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Text(
                                      widget.labourer.serviceCategories?[index],
                                      style: const TextStyle(
                                        color: Palette.green,
                                        fontSize: 10,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        const SizedBox(height: 10),
                        if (widget.labourer.address != '' &&
                            widget.labourer.address != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: Palette.green,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  widget.labourer.address ?? '',
                                ),
                              ),
                            ],
                          ),
                        Row(
                          children: [
                            Text(
                              'R${widget.labourer.rate ?? ' ?'}',
                              style: const TextStyle(
                                color: Palette.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Per Hour',
                              style: TextStyle(
                                color: Palette.darkGrey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageGallery(context),
                          if (widget.labourer.about != '' &&
                              widget.labourer.about != null)
                            const SizedBox(height: 10),
                          if (widget.labourer.about != '' &&
                              widget.labourer.about != null)
                            const Text(
                              'About Me',
                              style: kHeadingTextStyle,
                            ),
                          if (widget.labourer.about != '' &&
                              widget.labourer.about != null)
                            const SizedBox(height: 10),
                          Text(widget.labourer.about ?? ''),
                          if (widget.labourer.about != '' &&
                              widget.labourer.about != null)
                            const SizedBox(height: 20),
                          const Text(
                            'Reviews',
                            style: kHeadingTextStyle,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Palette.yellow,
                              ),
                              Text(
                                ' ${overallRating.isNaN ? '0' : overallRating.toStringAsFixed(overallRating.truncateToDouble() == overallRating ? 0 : 1)} (${widget.labourer.numberOfReviews ?? '0'} reviews)',
                                style: const TextStyle(
                                  color: Palette.darkGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          reviewListWidget(context),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Dialogs.showAlert(
                                  context: context,
                                  title: 'Qualifications',
                                  message: widget.labourer.membership ??
                                      'No qualifications uploaded.');
                            },
                            child: const Text(
                              'Qualifications',
                              style: kLinkTextStyle,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Dialogs.showAlert(
                                  context: context,
                                  title: 'Work experience',
                                  message: widget.labourer.membership ??
                                      'No work experience listed');
                            },
                            child: const Text(
                              'Work experience',
                              style: kLinkTextStyle,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Dialogs.showAlert(
                                  context: context,
                                  title: 'Memberships',
                                  message: widget.labourer.membership ??
                                      'No memberships listed');
                            },
                            child: const Text(
                              'Memberships',
                              style: kLinkTextStyle,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Dialogs.showAlert(
                                  context: context,
                                  title: 'Pictures of my work',
                                  message: widget.labourer.membership ??
                                      'No pictures uploaded.');
                            },
                            child: const Text(
                              'Pictures of my work',
                              style: kLinkTextStyle,
                            ),
                          ),
                          // StreamBuilder<List<ReviewModel>>(
                          //   stream: getReviewList(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.hasError) {
                          //       return const Padding(
                          //         padding: EdgeInsets.all(20),
                          //         child: Center(
                          //           child: Text(
                          //             'There was an error connecting to the server. Please try again later.',
                          //             textAlign: TextAlign.center,
                          //           ),
                          //         ),
                          //       );
                          //     } else if (snapshot.hasData) {
                          //       final reviews = snapshot.data;
                          //       if (reviews!.isEmpty) {
                          //         return Padding(
                          //           padding: const EdgeInsets.all(20),
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: const [
                          //               Text('This worker has not been rated yet'),
                          //             ],
                          //           ),
                          //         );
                          //       }
                          //       return ListView(
                          //         children: reviews.map(buildReview).toList(),
                          //       );
                          //     } else {
                          //       return Center(
                          //         child: spinLoader,
                          //       );
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 71,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: sendingEmail
                  ? spinLoader
                  : GestureDetector(
                      onTap: () async {
                        if (widget.labourer.labourerType?.toLowerCase() ==
                            'individual') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailScreen(
                                  labourer: widget.labourer),
                            ),
                          );
                        } else {
                          setState(() {
                            sendingEmail = true;
                          });
                          final smtpServer = SmtpServer(
                            'mail.ernic.co.za',
                            username: 'test@ernic.co.za',
                            password: 'M6Lcc#shY[0',
                          );

                          final message = Message()
                            ..from = Address('test@ernic.co.za', 'PickMe')
                            // ..recipients.add(widget.labourer
                            //     .email)
                            ..recipients = [widget.labourer.email]
                            ..subject = 'PickMe Quote Request'
                            ..text =
                                'You have received a quote request from $customerName: ${user.email}'
                            ..html =
                                "<h1>PickMe Quote Request</h1>\n<p>You have received a quote request from:</p><p>$customerName<br/>${user.email}</p><p>Please contact them to discuss their needs.</p><p>Regards,<br/>PickMe</p>";

                          try {
                            final sendReport = await send(message, smtpServer);
                            if (mounted) {
                              Dialogs.showAlert(
                                  context: context,
                                  title: 'Thank you!',
                                  message:
                                      'Your details have been forwarded to the business that will be in touch with you directly.');
                            }
                            log('Message sent: ${sendReport.toString()}');
                          } catch (e) {
                            log('Error occurred while sending email: $e');
                          }

                          setState(() {
                            sendingEmail = false;
                          });
                        }
                      },
                      child: greenButton(
                          label: widget.labourer.labourerType == 'individual'
                              ? 'Book Now'
                              : 'Request a Quote')),
            )
          ],
        ),
      ),
    );
  }
}
