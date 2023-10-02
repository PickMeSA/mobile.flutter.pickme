import 'package:app/models/review_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/palette.dart';

Widget ReviewListItem({required ReviewModel review}) {
  return Container(
    padding: const EdgeInsets.only(
      top: 10,
    ),
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            review.customer["profileImage"] != null && review.customer["profileImage"] != ""
                ? CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(review.customer["profileImage"]),
                  )
                : CircleAvatar(
                    radius: 24,
                    backgroundColor: Palette.grey.withOpacity(0.5),
                    child: const Icon(
                      Icons.person,
                      color: Palette.grey,
                      size: 30,
                    ),
                  ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                review.customer["fullName"],
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Palette.green, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 7,
                  top: 4,
                  right: 10,
                  bottom: 4,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Palette.green,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      review.rating.toStringAsFixed(review.rating.truncateToDouble() == review.rating ? 0 : 1),
                      style: const TextStyle(
                        color: Palette.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(review.details),
        const SizedBox(height: 10),
        Text(
          DateFormat.yMMMd().format(review.date),
          style: TextStyle(color: Palette.grey),
        ),
        const Divider(),
      ],
    ),
  );
}
