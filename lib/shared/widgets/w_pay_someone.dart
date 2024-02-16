

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/shared/widgets/w_text.dart';

Widget wPaySomeone({
  required BookingEntity bookingEntity,
  required String currency,
  required String buttonCation,
  required ThemeData theme,
  required Function onTap,
}
    ){
  return Column(
    children: [
      20.height,
      SizedBox(
        height: 100,
        child:
        Row(
          children: [
            10.width,
            Column(
              children: [
                Stack(
                    children:[
                      CircleAvatar(
                        radius: 27,
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      Positioned(
                        left: 2,
                        top: 2,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: theme.colorScheme.background,
                          child: wText("${bookingEntity.labourerEntity.firstName![0]}${bookingEntity.labourerEntity.surname![0]}", style: TextStyle(color: theme.primaryColor)),
                        ),
                      ),
                    ] ),
              ],
            ),
            20.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wText("${bookingEntity.labourerEntity.firstName!} ${bookingEntity.labourerEntity.surname}",style: theme.textTheme.titleMedium),
                  40.height,
                  Row(
                    children: [
                      wText(""),
                      Spacer(),
                      InkWell(onTap: ()=> onTap(),
                          child: wText(buttonCation,style: TextStyle(color: theme.primaryColor, decoration: TextDecoration.underline,  fontWeight: FontWeight.bold))),
                      60.width
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      AppDivider()
    ],
  );
}