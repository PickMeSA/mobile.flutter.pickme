import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';

Widget wBankDetailsCard ({
required String accountName,
required String bankName,
required String accountType,
required String accountNumber,
required ThemeData theme,
required Function onTap}){
  return SizedBox(
    height: 190,
    child: Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                wText(accountName, style: TextStyle(
                  fontSize: 20,
                  color: theme.primaryColor
                )),
                Spacer(),
                InkWell(
                  onTap: ()=> onTap(),
                  child: Icon(Iconsax.edit ),
                )
              ],
            ),
            10.height,
            const AppDivider(),
            10.height,
            wText(bankName, style: TextStyle(fontWeight: FontWeight.w600)),
            5.height,
            wText(accountType),
            wText(accountNumber, style: TextStyle(fontWeight: FontWeight.w100))
          ],
        ),
      ),
    ) ,
  );
}