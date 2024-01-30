
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_list_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
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
        return state.dataState == DataState.loading && state is GetProfileDetailsState
            || state.dataState == DataState.init?
        const Center(child: CircularProgressIndicator(),):
        state.dataState == DataState.init ?const Center(child: CircularProgressIndicator(),)
        :Padding(
          padding: const EdgeInsets.all(20),
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
                30.height,
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
                                wText("${getBloc().profileEntity!.firstName} ${getBloc().profileEntity!.surname}",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                                const Spacer(),
                                  InkWell(
                                    onTap: ()async{
                                      try {
                                        await context
                                            .router.push(
                                            EditPersonalDetailsRoute(
                                                profileEntity: getBloc()
                                                    .profileEntity!));
                                        getBloc().add(GetProfileDetailsEvent());
                                      }catch(ex){

                                      }
                                      },
                                    child: const Icon(Iconsax.edit),
                                  )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wText(getBloc().profileEntity!.industry!.industry!.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,),),

                                wText(getBloc().profileEntity!.location!.address.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,),),

                                  wText(getBloc().profileEntity!.industry?.industry??""),
                                Row(
                                  children: [
                                    AppStarRating(rating: 3, onChanged: (int index)=>debugPrint("Clicked index: $index"),),
                                    wText(3.toDouble().toString()),
                                    const Spacer(),
                                    GestureDetector(onTap: ()=>context.router.push(MyReviewsRoute()),
                                      child: wText(getLocalization().seeReviews,style: const TextStyle(decoration: TextDecoration.underline)),)
                                  ],
                                ),
                                  wText("R${getBloc().profileEntity!.hourlyRate} p/h"),
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
                      onTap: ()async{
                        try {
                          await context.router
                              .push(EditAboutMeRoute(profileEntity: getBloc()
                              .profileEntity!));
                          getBloc().add(GetProfileDetailsEvent());
                        }catch(ex){
                          print(ex.toString());
                        }
                        },
                      child: const Icon(Iconsax.edit),
                    ),
                  ],
                ),
                20.height,
                wText(getBloc().profileEntity!.description!),
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                20.height,
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                const AppDivider(),
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                10.height,
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                Row(
                  children: [
                    wText(getLocalization().mySkills, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()async{
                        try {
                          await context.router
                              .push(EditSkillsRoute(profileEntity: getBloc()
                              .profileEntity!));
                          getBloc().add(GetProfileDetailsEvent());
                        }catch(ex){
                          print(ex.toString());
                        }
                      } ,
                      child: const Icon(Iconsax.edit),
                    ),
                  ],
                ),
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                20.height,
                if(getBloc().profileEntity!.skills!.isNotEmpty)
                SizedBox(
                  height: 150 ,
                  child: Center(
                    child: ChipGroup(
                      inputs: getBloc().skills,
                      onDeleted: (int index){
                      //  getBloc().add(SkillChipDeletedEvent(index: 0));
                      },
                    ),
                  ),
                ),
                20.height,
                const AppDivider(),
                2.height,
                Row(
                  children: [
                    wText(getLocalization().workExperience, style: theme.textTheme.titleMedium),
                    const Spacer(),
                    InkWell(
                      onTap: ()async {
                        try {
                          await context.router
                              .push(EditWorkExperienceRoute(
                              profileEntity: getBloc()
                                  .profileEntity!));
                          getBloc().add(GetProfileDetailsEvent());
                        }catch(ex){
                          print(ex.toString());
                        }
        } ,
                      child: const Icon(Iconsax.edit),
                    ),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getBloc().profileEntity!.workExperience!.length,
                      itemBuilder:(context, index) {
                        return AppProfileQualification(
                            qualification: Award(
                                name: getBloc().profileEntity!.workExperience![index].title!,
                                //otpWorkExperienceEntityList![index].title!,
                                institutionName: getBloc().profileEntity!.workExperience![index].company!,
                                //otpWorkExperienceEntityList![index].company!,
                                qualificationType: AppQualificationType
                                    .experience,
                                dateStarted: getBloc().profileEntity!.workExperience![index].startDate,
                                //otpWorkExperienceEntityList![index].startDate!,
                                dateEnded: getBloc().profileEntity!.workExperience![index].endDate //otpWorkExperienceEntityList![index].endDate!
                            ));
                      }
                    ),

                    wText(getLocalization().photosOfWork),
                    20.height,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    itemCount: getBloc().profileEntity!.workExperience?.length,
                    itemBuilder: (context, index){
                      return
                        getBloc().profileEntity!.workExperience?[index].files == null &&
                            getBloc().profileEntity!.workExperience![index].files!.isEmpty && index != 0 && !index.isOdd ?
                      const SizedBox():
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                if(index.isEven || index == 0)
                                  Expanded(child: ImageThumbnail(
                                    imagePath:  getBloc().profileEntity!.workExperience?[index].files?[index].url,
                                    //onRemove: ()=> getBloc().add(RemoveImageClickedEvent(index: index)),
                                  )),
                                16.width, // Add some spacing between images
                                if(getBloc().profileEntity!.workExperience?[index].files?.length == index + 1)
                                  Expanded(child: Container(),),
                                if(getBloc().profileEntity!.workExperience![index].files!.length > index + 1 && index.isEven)
                                  Expanded(child: ImageThumbnail(
                                    imagePath:  getBloc().profileEntity!.workExperience?[index].files?[index + 1].url,
                                    //onRemove: ()=>getBloc().add(RemoveImageClickedEvent(index: index + 1)),
                                  )),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
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
                      onTap: ()async{
                        try {
                          await context.router
                              .push(EditQualificationRoute(
                              profileEntity: getBloc()
                                  .profileEntity!));
                        }catch(ex){
                        }
                      } ,
                      child: const Icon(Iconsax.edit),
                    ),
                  ],
                ),
                20  .height,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: getBloc().profileEntity!.qualifications!.length,
                    itemBuilder:(context, index) {
                      return AppProfileQualification(
                          qualification: Award(
                            issuedOn: getBloc().profileEntity!.qualifications![index].issueDate,
                              educationType: getBloc().profileEntity!.qualifications![index].type,
                              name: getBloc().profileEntity!.qualifications![index].name!,
                              //otpWorkExperienceEntityList![index].title!,
                              institutionName: getBloc().profileEntity!.qualifications![index].issuingOrganization!,
                              //otpWorkExperienceEntityList![index].company!,
                              qualificationType: AppQualificationType
                                  .education,
                              dateStarted: getBloc().profileEntity!.qualifications![index].issueDate,
                              //otpWorkExperienceEntityList![index].startDate!,
                              dateEnded: getBloc().profileEntity!.qualifications![index].issueDate
                            //otpWorkExperienceEntityList![index].endDate!
                          ));
                    }
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
