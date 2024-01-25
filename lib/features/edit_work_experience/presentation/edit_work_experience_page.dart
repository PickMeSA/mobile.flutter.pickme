
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/edit_work_experience/presentation/bloc/edit_work_experience_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_award.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';


@RoutePage()
class EditWorkExperiencePage extends BasePage {
   EditWorkExperiencePage({required this.profileEntity,super.key});
  ProfileEntity profileEntity;

  @override
  _EditWorkExperiencePageState createState() => _EditWorkExperiencePageState();
}

class _EditWorkExperiencePageState extends BasePageState<EditWorkExperiencePage, EditWorkExperienceBloc> {

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
    return BlocConsumer<EditWorkExperienceBloc, EditWorkExperiencePageState>(
      listener: (context, state){
        if(state.dataState == DataState.success && state is SubmitWorkExperienceState ){
          Navigator.pop(context);
          context.router.pop();
        }

        if(state.dataState == DataState.loading && state is SubmitWorkExperienceState ){
          preloader(context);
        }

        if(state.dataState == DataState.error && state is SubmitWorkExperienceState ){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                   Row(
                     children: [
                       InkWell(onTap: ()=> context.router.pop()
                           ,child: const Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().workExperience, style: theme.textTheme.titleLarge),
                       const Spacer(),
                       InkWell(
                         onTap:()async{
                           try {
                             OTPWorkExperienceEntity? otpWorkExperienceEntity =
                             (await context.router.push(
                                  AddWorkExperienceRoute()) as OTPWorkExperienceEntity);
                             if (otpWorkExperienceEntity != null) {
                               widget.profileEntity.workExperience?.add(
                                   otpWorkExperienceEntity);
                               getBloc().add(EditWorkExperienceAddWorkEvent());
                             }
                           }catch(ex){
                             //empty object
                           }
                         } ,
                           child: const Icon(Iconsax.add, color: Colors.black,))
                     ],
                   ),

                   30.height,
                   ListView.builder(
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: widget.profileEntity.workExperience!.length,
                       itemBuilder:(context, index) {
                         return AppProfileQualification(
                           onEdit: ()async{
                             await context.router.push(EditWorkExperienceDetailsRoute(
                                 otpWorkExperienceEntity: widget.profileEntity.workExperience![index]));

                             },
                             qualification: Award(
                                 name: widget.profileEntity.workExperience![index].title!,
                                 //otpWorkExperienceEntityList![index].title!,
                                 institutionName: widget.profileEntity.workExperience![index].company!,
                                 //otpWorkExperienceEntityList![index].company!,
                                 qualificationType: AppQualificationType
                                     .experience,
                                 dateStarted:widget.profileEntity.workExperience![index].startDate,
                                 //otpWorkExperienceEntityList![index].startDate!,
                                 dateEnded: widget.profileEntity.workExperience![index].endDate //otpWorkExperienceEntityList![index].endDate!
                             ));
                       }
                   ),
                   if(widget.profileEntity.workExperience!.isNotEmpty)
                   20.height,
                   if(widget.profileEntity.workExperience!.isNotEmpty)
                   Row(
                     children: [

                       Expanded(
                         child: PrimaryButton(
                           style: ButtonStyle(
                               side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                 return BorderSide(
                                   color: states.contains(MaterialState.disabled)?
                                   theme.colorScheme.primary.withOpacity(0):
                                   theme.colorScheme.primary,
                                   width: 2,
                                 );
                               }
                               ),
                               backgroundColor: MaterialStateProperty.resolveWith(
                                       (Set<MaterialState> states){
                                     return states.contains(MaterialState.disabled)?
                                     theme.colorScheme.primary.withOpacity(0.3):
                                     theme.colorScheme.primary;
                                   }
                               )
                           ),
                           onPressed: () {
                             getBloc().add(SubmitWorkExperienceEvent(profileEntity: widget.profileEntity));
                           },
                           child: Text(getLocalization().update),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
           ),
          );
      },
    );
  }


  @override
  EditWorkExperienceBloc initBloc() {
    return locator<EditWorkExperienceBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
