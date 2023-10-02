import 'package:app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';

class ReviewWorkerScreen extends StatefulWidget {
  @override
  State<ReviewWorkerScreen> createState() => _ReviewWorkerScreenState();
}

class _ReviewWorkerScreenState extends State<ReviewWorkerScreen> {
  TextEditingController _reviewController = TextEditingController();

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Rate Worker'),
            actions: [
              GestureDetector(
                child: SvgPicture.asset('assets/icons/more.svg'),
              ),
              const SizedBox(width: 20),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Write your review',
                  style: kHeadingTextStyle,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _reviewController,
                  textCapitalization: TextCapitalization.sentences,
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
                      onRatingUpdate: (rating) {
                        setState(() {
                          this.rating = rating;
                        });
                      },
                      unratedColor: Palette.orange.withOpacity(0.25),
                      allowHalfRating: true,
                      glow: false,
                      updateOnDrag: true,
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
                Expanded(child: Container()),
                const Divider(),
                GestureDetector(
                  onTap: () {},
                  child: greenButton(label: 'Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
