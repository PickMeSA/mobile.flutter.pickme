
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_qualification_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_work_experinence_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_award.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/edit_qualification_bloc.dart';

@RoutePage()
class EditQualificationPage extends BasePage {
   EditQualificationPage({required this.profileEntity,super.key});
  ProfileEntity profileEntity;


  @override
  _EditQualificationPageState createState() => _EditQualificationPageState();
}

class _EditQualificationPageState extends BasePageState<EditQualificationPage, EditQualificationBloc> {

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
    return BlocConsumer<EditQualificationBloc, EditQualificationPageState>(
      listener: (context, state){

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
                      wText(getLocalization().qualificationMembership, style: theme.textTheme.titleLarge),
                      const Spacer(),
                      InkWell(
                          onTap:()async{
                            try {
                              OTPQualificationEntity? otpQualificationEntity =
                              (await context.router.push(
                                  const AddQualificationRoute()) as OTPQualificationEntity);
                              if (otpQualificationEntity != null) {
                                widget.profileEntity.qualifications?.add(
                                    otpQualificationEntity);
                                getBloc().add(EditQualificationAddQualificationEvent());
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
                      itemCount: widget.profileEntity.qualifications!.length,
                      itemBuilder:(context, index) {
                        return AppProfileQualification(
                            onEdit: ()=> context.router.push(EditQualificationDetailsRoute(otpQualificationEntity: widget.profileEntity.qualifications![index])),
                            qualification: Award(
                                name: widget.profileEntity.qualifications![index].name!,
                                educationType: widget.profileEntity.qualifications![index].type,
                                institutionName: widget.profileEntity.qualifications![index].issuingOrganization!,
                                qualificationType: AppQualificationType
                                    .education,
                                issuedOn: widget.profileEntity.qualifications![index].issueDate!,
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
                              getBloc().add(SubmitQualificationEvent(profileEntity: widget.profileEntity));
                            },
                            child: Text(getLocalization().save),
                          ),
                        ),
                      ],
                    ),
                  if(widget.profileEntity.qualifications!.isNotEmpty)
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
                             // getBloc().add(SubmitWorkExperienceEvent(profileEntity: widget.profileEntity));
                            },
                            child: Text(getLocalization().save),
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
  EditQualificationBloc initBloc() {
    return locator<EditQualificationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
