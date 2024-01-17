
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_award.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/profile_bloc.dart';

@RoutePage()
class ProfilePage extends BasePage {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage, ProfileBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getBloc().add(GetProfileDetailsEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfilePageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_circle_outlined, size: 40,),
                    10.width,
                    wText(getLocalization().profile,
                        style: theme.textTheme.headlineMedium),
                    const Spacer(),
                    InkWell(onTap: (){context.router.pop();},child: const Icon(Iconsax.menu, size: 25,)),
                  ],
                ),
                10.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppImageAvatar.small(),
                    10.width,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                wText("${getBloc().profileEntity.firstName} ${getBloc().profileEntity.surname}",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                const Spacer(),
                                  InkWell(
                                    onTap: ()=> print("Profile"),
                                    child: const Icon(Iconsax.edit),
                                  )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wText(getBloc().profileEntity.location!.address.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,),),

                                  wText("occupation"!),
                                Row(
                                  children: [
                                    AppStarRating(rating: 3, onChanged: (int index)=>debugPrint("Clicked index: $index"),),
                                    wText(3.toDouble().toString()),
                                    const Spacer(),
                                    wText(getLocalization().seeReviews,style: TextStyle(decoration: TextDecoration.underline)),
                                  ],
                                ),
                                  wText("R${getBloc().profileEntity.hourlyRate} p/h"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                20.height,
                const AppDivider(),
                10.height,
                Row(
                  children: [
                    wText(getLocalization().aboutMe, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()=> print("object"),
                      child: const Icon(Iconsax.edit),
                    ),

                  ],
                ),
                20.height,
                wText(getBloc().profileEntity.description!),
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                20.height,
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                const AppDivider(),
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                10.height,
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                Row(
                  children: [
                    wText(getLocalization().mySkills, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()=> print("object"),
                      child: const Icon(Iconsax.edit),
                    ),

                  ],
                ),
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                20.height,
                if(getBloc().profileEntity.skillIds!.isNotEmpty)
                SizedBox(
                  height: 250 ,
                  child: Center(
                    child: ChipGroup(
                      inputs: [],
                      onDeleted: (int index){
                      //  getBloc().add(SkillChipDeletedEvent(index: 0));
                      },
                    ),
                  ),
                ),
                20.height,
                if(getBloc().profileEntity.workExperience!.isNotEmpty)
                const AppDivider(),
                if(getBloc().profileEntity.workExperience!.isNotEmpty)
                10.height,
                if(getBloc().profileEntity.workExperience!.isNotEmpty)
                Row(
                  children: [
                    wText(getLocalization().workExperience, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()=> print("object"),
                      child: const Icon(Iconsax.edit),
                    ),

                  ],
                ),
                if(getBloc().profileEntity.workExperience!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: getBloc().profileEntity.workExperience!.length,
                        itemBuilder:(context, index) {
                          return AppProfileQualification(
                              qualification: Award(
                                  name: getBloc().profileEntity.workExperience![index].title!,
                                  //otpWorkExperienceEntityList![index].title!,
                                  institutionName: getBloc().profileEntity.workExperience![index].company!,
                                  //otpWorkExperienceEntityList![index].company!,
                                  qualificationType: AppQualificationType
                                      .experience,
                                  dateStarted: getBloc().profileEntity.workExperience![index].startDate,
                                  //otpWorkExperienceEntityList![index].startDate!,
                                  dateEnded: getBloc().profileEntity.workExperience![index].endDate //otpWorkExperienceEntityList![index].endDate!
                              ));
                        }
                      ),
                    ),
                    wText(getLocalization().photosOfWork),
                  ],
                ),
                20.height,
                const AppDivider(),
                10.height,
                Row(
                  children: [
                    wText(getLocalization().qualificationMembership, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()=> print("object"),
                      child: const Icon(Iconsax.edit),
                    ),

                  ],
                ),
                20  .height,
                Container(
                  height: 300,
                  child: ListView.builder(
                      itemCount: getBloc().profileEntity.qualifications!.length,
                      itemBuilder:(context, index) {
                        return AppProfileQualification(
                            qualification: Award(
                              issuedOn: getBloc().profileEntity.qualifications![index].issueDate,
                                educationType: getBloc().profileEntity.qualifications![index].type,
                                name: getBloc().profileEntity.qualifications![index].name!,
                                //otpWorkExperienceEntityList![index].title!,
                                institutionName: getBloc().profileEntity.qualifications![index].issuingOrganization!,
                                //otpWorkExperienceEntityList![index].company!,
                                qualificationType: AppQualificationType
                                    .education,
                                dateStarted: getBloc().profileEntity.qualifications![index].issueDate,
                                //otpWorkExperienceEntityList![index].startDate!,
                                dateEnded: getBloc().profileEntity.qualifications![index].issueDate
                                     //otpWorkExperienceEntityList![index].endDate!
                            ));
                      }
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  ProfileBloc initBloc() {
    return locator<ProfileBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
