
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
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
    var theme = Theme.of(context);
    return BlocConsumer<QualificationsBloc, QualificationsPageState>(
      listener: (context, state){
        if(state is AddQualificationRemoteSubmitState && state.dataState == DataState.success){
          Navigator.pop(context);
          getBloc().preloaderActive = false;
         if(state.profileEntity!.skillIds!.skillIds!.isEmpty){
            context.router.push(const AddSkillsRoute());
          }else if(state.profileEntity!.hourlyRate! == 0){
            context.router.push(const RateAndWorkTimesRoute());
          }else if(state.profileEntity!.paymentDetails!.bankName!.isEmpty){
            context.router.push(const BankDetailsRoute());
          }else if(state.profileEntity!.location!.id!.isEmpty ){
            context.router.push(const LocationRoute());
          }else if(state.profileEntity!.description!.isEmpty){
            context.router.push(const FinalDetailsRoute());
          }else{
           context.router.pushAndPopUntil(const BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
         }
        }

        if(state is AddQualificationRemoteSubmitState && state.dataState == DataState.loading ){
          preloader(context);
          getBloc().preloaderActive = true;
        }

        if(state is AddQualificationRemoteSubmitState && state.dataState == DataState.error ){
          print(state.error);
        }
      },
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
                       const Spacer(),
                       InkWell(
                           onTap:()=> context.router.push(const AddSkillsRoute()),
                           child: wText(getLocalization().skip,
                               style: const TextStyle(
                                   fontSize: 14,
                                   fontWeight:
                                   FontWeight.w600)))
                     ],
                   ),
                   wText(
                     getLocalization().step2,
                     style: theme.textTheme.headlineLarge!.copyWith(
                       color: theme.primaryColor,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   wText(getLocalization().tellUsAboutYourQualifications,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: qualificationSlab(
                       otpQualificationEntityList: getBloc().otpQualificationEntityList,
                         otpWorkExperienceEntityList: [],
                         icon: const Icon(Icons.school_outlined,
                           size: 24,),
                         caption: getLocalization().qualificationMembership,
                       buttonCaption: getLocalization().addAQualificationMembership,
                       onClick: () async{
                           getBloc().add(AddQualificationEvent(
                               otpQualificationEntity: await context.router.push(const AddQualificationRoute()) as OTPQualificationEntity));
                       }
                     )
                   ),
                   SizedBox(height: 20,),
                   AppDivider(height: 1),
                   Padding(
                       padding: const EdgeInsets.only(top: 20),
                       child: qualificationSlab(
                         otpWorkExperienceEntityList: getBloc().otpWorKExperienceEntityList,
                           otpQualificationEntityList: [],
                           icon: const Icon(Iconsax.briefcase,
                             size: 24,),
                           caption: getLocalization().workExperience,
                           buttonCaption: getLocalization().addWorkExperience,
                         onClick: () async {
                           getBloc().add(AddWorkExperienceEvent(otpWorkExperienceEntity: await context.router.push(const AddWorkExperienceRoute()) as OTPWorkExperienceEntity))
                             ;
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
             Expanded(
               child: PrimaryButton(
                 style: ButtonStyle(
                     side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                       return BorderSide(
                         color: states.contains(MaterialState.disabled)?
                         theme.colorScheme.secondary.withOpacity(0):
                         theme.colorScheme.secondary,
                         width: 2,
                       );
                     }
                     ),
                     backgroundColor: MaterialStateProperty.resolveWith(
                             (Set<MaterialState> states){
                           return states.contains(MaterialState.disabled)?
                           theme.colorScheme.secondary.withOpacity(0.3):
                           theme.colorScheme.secondary;
                         }
                     )
                 ),
                 onPressed: () {
                   getBloc().add(AddQualificationRemoteSubmitEvent());
                 },
                 child: Text(getLocalization().nextStep),
               ),
             ),
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
