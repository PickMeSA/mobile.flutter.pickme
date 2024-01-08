import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/shared/widgets/w_text.dart';


Widget WClientWidget({
required String clientName,
required String areaLocation,
required int rating,
required BuildContext context,
  required String seeReviews,

}
){


  final Color color = const Color(0xFF9CA2AE);


  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Padding(
      padding:const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageAvatar.small(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wText(clientName,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Column(
                      children: [

                        Row(
                          children: [
                            Expanded(child: wText(areaLocation, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,),)),

                          ],
                        ),

                        Row(
                          children: [
                            AppStarRating(rating: rating, onChanged: (int index)=>debugPrint("Clicked index: $index"),),
                            wText(rating.toDouble().toString()),
                            const Spacer(),
                            wText(seeReviews,style: TextStyle(decoration: TextDecoration.underline)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

}