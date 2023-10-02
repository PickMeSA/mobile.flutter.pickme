import 'package:app/models/user_model.dart';
import 'package:flutter/material.dart';

import '../components/palette.dart';
import '../widgets/list_item_card.dart';

Container ServiceListItem({required UserModel userModel}) {
  num overallRating =
      userModel.overallRating! / userModel.numberOfReviews!.toDouble();
  return userCard(
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: userModel.profileImage == null ||
                        userModel.profileImage == ""
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
                          userModel.profileImage!,
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
                      userModel.fullName!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Palette.darkGrey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (userModel.tagline != '' && userModel.tagline != null)
                      Text(
                        userModel.tagline!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          'R',
                          style: TextStyle(
                            color: Palette.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          userModel.rate == null
                              ? ' ?'
                              : userModel.rate.toString(),
                          style: const TextStyle(
                            color: Palette.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          ' / Hour',
                          style: TextStyle(
                            color: Palette.darkGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Palette.yellow,
                          size: 14,
                        ),
                        Text(
                          ' ${overallRating.isNaN ? '0' : overallRating.toStringAsFixed(overallRating.truncateToDouble() == overallRating ? 0 : 1)}  |  ${userModel.numberOfReviews ?? '0'} reviews',
                          style: const TextStyle(
                            color: Palette.darkGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: userModel.labourerType == 'business'
                  ? Colors.blue.withOpacity(0.25)
                  : Palette.green.withOpacity(0.25),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userModel.labourerType == 'business'
                      ? 'BUSINESS'
                      : 'INDIVIDUAL',
                  style: TextStyle(
                    color: userModel.labourerType == 'business'
                        ? Colors.blue
                        : Palette.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
