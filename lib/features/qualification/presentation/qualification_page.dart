
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_qualification_slab.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/qualification_bloc.dart';

@RoutePage()
class QualificationsPage extends BasePage {
  const QualificationsPage({super.key});

  @override
  _QualificationsPageState createState() => _QualificationsPageState();
}

class _QualificationsPageState extends BasePageState<QualificationsPage, QualificationsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<QualificationsBloc, QualificationsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child:SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Spacer(),
                       wText(getLocalization().skip,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
                     ],
                   ),
                   wText(getLocalization().step2,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                   const SizedBox(height: 10,),
                   wText(getLocalization().tellUsAboutYourQualifications,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: qualificationSlab(
                         icon: const Icon(Icons.school_outlined,
                           size: 24,),
                         caption: getLocalization().qualifications,
                       buttonCaption: getLocalization().addAQualification,
                       onClick: (){
                           context.router.push(AddQualificationRoute());
                       }
                     )
                   ),
                   SizedBox(height: 20,),
                   Divider(height: 1),
                   Padding(
                       padding: const EdgeInsets.only(top: 20),
                       child: qualificationSlab(
                           icon: const Icon(Icons.work_outline_rounded,
                             size: 24,),
                           caption: getLocalization().workExperience,
                           buttonCaption: getLocalization().addWorkExperience,
                         onClick: (){
                             context.router.push(AddWorkExperienceRoute());
                         }
                       )
                   ),
                   SizedBox(height: 20,),
                   Divider(height: 1,),
                   Padding(
                       padding: const EdgeInsets.only(top: 20),
                       child: qualificationSlab(
                           icon: const Icon(Icons.star_outline_rounded,
                             size: 24,),
                           caption: getLocalization().membershipAwardName,
                           buttonCaption: getLocalization().addMembershipOrAward,
                         onClick: (){
                             context.router.push(AddMembershipsRoute());
                         }
                       )
                   ),
                   const SizedBox(height: 50,),
                   Row(
                     children: [
                       Container(
                         height: 56,
                           width: 56,
                         decoration: BoxDecoration(
                             border: Border.all(width: 2,
                                 color: Colors.black),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: InkWell(onTap: ()=> context.router.pop(),child: const Icon(Icons.arrow_back)) ,
                         
                       ),
                       const SizedBox(width: 10,),
                       PrimaryButton(onPressed: (){
                         context.router.push(SkillsAndIndustryRoute());
                       },
                         fullWidth:  false,
                       width: MediaQuery.sizeOf(context).width * 3.6/5,
                         child: wText(getLocalization().nextStep),)
                     ],
                   )



                 ],
               ),
             ),
           )  ,
          );
      },
    );
  }


  @override
  QualificationsBloc initBloc() {
    return locator<QualificationsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
}
