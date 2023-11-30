import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/features/membership_information/entities/membership_information_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/shared/widgets/w_text.dart';

Widget wMembershipInformation ({
    required BuildContext context,
    required MembershipInformationEntity membershipInformationEntity,
    required ThemeData theme}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      20.height,
      wText(membershipInformationEntity.membershipItemEntity.name, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
      5.height,
      wText(membershipInformationEntity.membershipItemEntity.description,style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
      35.height,
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: membershipInformationEntity.informationItemWEntityList.length,itemBuilder: (context , index){
        return Column(
          children: [
            ListTile(
              dense:true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              titleAlignment: ListTileTitleAlignment.titleHeight,
              leading: const Icon(Iconsax.tick_square,size: 20,),
              title: wText (membershipInformationEntity.informationItemWEntityList[index].title, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600)),

            ),
            5.height,
            wText(membershipInformationEntity.informationItemWEntityList[index].description, style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14,fontWeight: FontWeight.w400)),
            35.height,
          ],
        );
      },),

      const AppDivider(),
    ],
  );
}