
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/edit_work_experience/presentation/bloc/edit_work_experience_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_award.dart';
import 'package:pickme/shared/widgets/w_text.dart';

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
      listener: (context, state){},
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
                     ],
                   ),

                   20.height,
                   ListView.builder(
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: widget.profileEntity.workExperience!.length,
                       itemBuilder:(context, index) {
                         return AppProfileQualification(
                           onEdit: ()=> context.router.push(EditWorkExperienceDetailsRoute(otpWorkExperienceEntity: widget.profileEntity.workExperience![index])),
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
