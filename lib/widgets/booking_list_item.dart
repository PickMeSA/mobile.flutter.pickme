import 'package:app/models/booking_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expandable/expandable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../components/palette.dart';
import '../widgets/list_item_card.dart';

Container BookingListItem({
  required String userRole,
  required BookingModel bookingModel,
  required Function onCancel,
  required Function onMarkComplete,
  required Function onReschedule,
  required Function onRate,
  required Function onChat,
  Function? onAccept,
  Function? onReject,
  Function? onPay,
}) {
  return ListItemCard(
    ExpandableNotifier(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          tapHeaderToExpand: true,
          hasIcon: false,
          tapBodyToCollapse: true,
        ),
        header: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: (userRole == 'customer' &&
                          (bookingModel.labourer!["profileImage"] == null || bookingModel.labourer!["profileImage"] == "")) ||
                      (userRole == 'labourer' &&
                          (bookingModel.customer!["profileImage"] == null || bookingModel.customer!["profileImage"] == ""))
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Palette.grey.withOpacity(0.5),
                        child: const Icon(
                          Icons.person,
                          color: Palette.grey,
                          size: 60,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        userRole == 'customer' ? bookingModel.labourer!["profileImage"] : bookingModel.customer!["profileImage"],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookingModel.category!,
                    style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userRole == 'customer' ? bookingModel.labourer!["fullName"] : bookingModel.customer!["fullName"],
                    style: const TextStyle(
                      color: Palette.darkGrey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: bookingModel.status! == 'cancelled' ? Colors.red : Palette.green,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Text(
                      '${bookingModel.status![0].toUpperCase()}${bookingModel.status!.substring(1).toLowerCase()}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if(bookingModel.status! != 'request' && bookingModel.status! != 'confirmed')GestureDetector(
              onTap: () {
                onChat();
              },
              child: SvgPicture.asset('assets/icons/chat.svg'),
            ),
          ],
        ),
        expanded: Column(
          children: [
            const Divider(),
            Row(
              children: [
                const Text(
                  'Date & Time',
                  style: TextStyle(color: Palette.grey),
                ),
                Expanded(
                  child: Text(
                    '${DateFormat('MMM d, yyyy').format(bookingModel.date!)} | ${bookingModel.startTime} - ${bookingModel.endTime}',
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(color: Palette.grey),
                ),
                Expanded(
                  child: Text(
                    bookingModel.address!,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  'Details',
                  style: TextStyle(color: Palette.grey),
                ),
              ],
            ),
            Text(
              bookingModel.details!,
            ),
            const SizedBox(height: 10),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: GoogleMap(
                markers: {
                  Marker(
                    markerId: const MarkerId('jobMarker'),
                    position: LatLng(bookingModel.lat!, bookingModel.lng!),
                  ),
                },
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(bookingModel.lat!, bookingModel.lng!),
                  zoom: 15.5,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if(bookingModel.status! == 'request' && userRole == 'labourer')
                Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              onReject!();
                            },
                            child: smallWhiteButton(label: 'Reject')),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              onAccept!();
                            },
                            child: smallGreenButton(label: 'Accept')),
                      ),
                    ],
                  ),
            if(bookingModel.status! == 'request' && userRole == 'customer')
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          onCancel();
                        },
                        child: smallWhiteButton(label: 'Cancel')),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            if (bookingModel.status! == 'confirmed' && userRole == 'customer')
               Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        onCancel();
                      },
                      child: smallWhiteButton(label: 'Cancel Booking')),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        onPay!();
                      },
                      child: smallGreenButton(label: 'Pay')),
                ),
              ],
            ),
            bookingModel.status! == 'upcoming'
                ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                onCancel();
                              },
                              child: smallWhiteButton(label: 'Cancel Booking'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  onReschedule();
                                },
                                child: smallGreenButton(label: 'Reschedule')),
                          ),
                        ],
                      ),
                      if (userRole == 'labourer') const SizedBox(height: 10),
                      if (userRole == 'labourer')
                        GestureDetector(
                          onTap: () {
                            onMarkComplete();
                          },
                          child: smallButton(label: 'Mark as Complete', color: Colors.black, textColor: Colors.white),
                        ),
                    ],
                  )
                : bookingModel.status == 'completed' && userRole != 'labourer'
                    ? bookingModel.reviewed == null || bookingModel.reviewed != true
                        ? Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      onRate();
                                    },
                                    child: smallGreenButton(label: 'Rate Worker')),
                              ),
                            ],
                          )
                        : const Text(
                            'Thank you for reviewing!',
                            style: TextStyle(color: Palette.lightGreen),
                          )
                    : Row(),
            const SizedBox(height: 10),
            const Icon(
              Icons.expand_less,
              color: Palette.grey,
            )
          ],
        ),
        collapsed: Container(),
      ),
    ),
  );
}
