import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/create_job_listing/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/functions/required_text_validator.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_labeled_panel.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/create_job_listing_bloc.dart';

@RoutePage()
class CreateJobListingPage extends BasePage {
  const CreateJobListingPage({super.key});


  @override
  State<CreateJobListingPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<CreateJobListingPage, CreateJobListingBloc> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController hoursTextController = TextEditingController();
  TextEditingController totalFeeTextController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getBloc().add(CreateJobListingPageEnteredEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<CreateJobListingBloc, CreateJobListingState>(
      listener: (context, state) {
        //loading
        if(state is CreateJobPageSubmitJobState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }

          //loading
        if(state is CreateJobPageSubmitJobState && state.dataState == DataState.success){
          Navigator.pop(context); //Remove loader
          Navigator.pop(context); //Navigate back to my job listings page
        }          //loading
        if(state is CreateJobPageSubmitJobState && state.dataState == DataState.error){
          Navigator.pop(context); //Remove loader
        //   todo: Display error
        }
      },
      builder: (context, state) {

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getLocalization().jobListingDetails, style: theme.textTheme.bodyMedium!.copyWith(
                      fontVariations: 600.fontWeight
                  ),),
                  24.height,
                  Column(
                    children: [
                      AppTextFormField(
                        controller: jobTitleController,
                        textFieldType: TextFieldType.OTHER,
                        labelText: "${getLocalization().jobName} *",
                        validator: requiredTextValidator,
                      ),
                      16.height,
                      AppTextFormField(
                        controller: jobDescriptionController,
                        textFieldType: TextFieldType.MULTILINE,
                        labelText: "${getLocalization().jobDescription} *",
                        hint: getLocalization().loremIpsumDescriptionField,
                        validator: requiredTextValidator,
                      ),
                      GestureDetector(
                        onTap: () => _pickFile(),
                        child: labelledPanel(
                            labelText: getLocalization().photosOptional,
                            content: Container(
                              height: 96 ,
                              child: Center(child: Row(
                                children: [
                                  const Spacer(),
                                  (state is JobImageAddedState && state.dataState == DataState.loading)?
                                  const CircularProgressIndicator():SvgPicture.asset("assets/upload_icon.svg"),
                                  10.width,
                                  wText(getLocalization().upload, style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400, color: Colors.grey
                                  )),
                                  const Spacer(),
                                ],
                              )),
                            )),
                      ),
                      if(getBloc().photos.isNotEmpty)Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Expanded(child: ImageThumbnail(
                              imagePath:  getBloc().photos[0].url,
                              onRemove: ()=> getBloc().add(RemoveImageClickedEvent(index: 0)),
                            )),
                            16.width, // Add some spacing between images
                            if(getBloc().photos.length == 1) Expanded(child: Container(),),
                            if(getBloc().photos.length >1)Expanded(child: ImageThumbnail(
                              imagePath:  getBloc().photos[1].url,
                              onRemove: ()=>getBloc().add(RemoveImageClickedEvent(index: 1)),
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  24.height,
                  Text(getLocalization().dateAndTime, style: theme.textTheme.bodyMedium!.copyWith(
                      fontVariations: 600.fontWeight
                  ),),
                  16.height,
                  CheckboxListTile(
                      title: Text(getLocalization().iMFlexibleOpenToDiscuss),
                      value: getBloc().flexibleHoursChecked,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool? value)=> getBloc().add(FlexibleHoursCheckboxChangedEvent(checked: value!))),
                  if(!getBloc().flexibleHoursChecked)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          AppCenteredDivider(text: getLocalization().or),
                          16.height,
                          Row(
                            children: [
                              Expanded(
                                child: DateTextBox(labelText: getLocalization().startDate,
                                  controller: startDateController,
                                  onDateSelected: (DateTime dateTime){
                                    startDate = dateTime;
                                    startDateController.text = dateTime.toDDMMYYYY();
                                  },),
                              ),
                              8.width,
                              Expanded(
                                child: DateTextBox(
                                  labelText: getLocalization().endDate,
                                  hint: getLocalization().endDate,
                                  controller: endDateController,
                                  onDateSelected: (DateTime dateTime){
                                    endDate = dateTime;
                                    endDateController.text = dateTime.toDDMMYYYY();
                                  },),
                              )
                            ],
                          ),
                          8.height,
                          AppTextFormField(controller: startTimeTextController,
                            onChanged: (value)=> debugPrint(value),
                            textFieldType: TextFieldType.NUMBER,
                            labelText: getLocalization().startTime,
                            suffix: InkWell(
                                onTap:() async {
                                  TimeOfDay? timeofDay = await showTimePicker(
                                      context: context,
                                      initialTime:  TimeOfDay.now(),
                                      initialEntryMode: TimePickerEntryMode.inputOnly);
                                  startTimeTextController.text =
                                  "${timeofDay?.hour}:${timeofDay!.minute < 10? "0${timeofDay.minute}": timeofDay.minute}";
                                },
                                child: const Icon(Iconsax.clock)),),
                        ],
                      ),
                    ),
                  24.height,
                  AppDivider(),
                  24.height,
                  Text(getLocalization().hoursAndTotalFee, style: theme.textTheme.bodyMedium!.copyWith(
                      fontVariations: 600.fontWeight
                  ),),
                  16.height,
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          labelText: "${getLocalization().estHours} *",
                          hint: "${getLocalization().estHours} *",
                          controller: hoursTextController,
                          textFieldType: TextFieldType.NUMBER,
                        ),
                      ),
                      8.width,
                      Expanded(
                        child: AppTextField(
                          labelText: getLocalization().totalFee,
                          hint: getLocalization().r00,
                          controller: totalFeeTextController,
                          textFieldType: TextFieldType.NUMBER,
                        ),
                      ),
                    ],
                  ),
                  24.height,
                  AppDivider(),
                  24.height,
                  Text(getLocalization().skillsRequired, style: theme.textTheme.bodyMedium!.copyWith(
                      fontVariations: 600.fontWeight
                  ),),
                  16.height,
                  AppMultiSelectDropdownMenu<JobsSkillEntity>(
                      leadingIcon: const Icon(Iconsax.add),
                      onSearch: (selected){
                        // getBloc().add(SkillSelectedEvent(skill: selected!));
                      },
                      onChanged: (selected){
                        getBloc().add(SkillSelectedEvent(skill: selected!));
                      },
                      width: MediaQuery.sizeOf(context).width - 70,
                      enableFilter: true,
                      dropdownMenuEntries: getBloc().skillEntries,
                      label: wText(getLocalization().skillsA,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.grey)
                      )
                  ),
                  SizedBox(
                    height: 250 ,
                    child: Center(
                      child: ChipGroup(
                        inputs: getBloc().chipOptions,
                        onDeleted: (int index){
                          getBloc().add(SkillChipDeletedEvent(index: index));
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: PrimaryButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
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
                        if(_formKey.currentState!.validate() &&
                            getBloc().chipOptions.isNotEmpty &&
                            getBloc().chipOptions.length<6 &&
                            startDate!=null &&
                            endDate!=null
                        ){
                          getBloc().add(CreateJobPageSubmitJobEvent(job: CreateJobPageJobEntity(
                              title: jobTitleController.text,
                              description: jobDescriptionController.text,
                              status: 'new',
                              startDate: startDate!,
                            endDate: endDate!,
                              startTime: startTimeTextController.text,
                              imFlexible: getBloc().flexibleHoursChecked,
                              estimatedHours: hoursTextController.text,
                              lat: 0,
                              lng: 0,
                              images: getBloc().photos.map((e) => e.url).toList(),
                              skills: getBloc().chipOptions
                          )));

                        }
                      },
                      child: Text(getLocalization().submit),
                    ),
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
  CreateJobListingBloc initBloc() {
    return locator<CreateJobListingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().createAJobListing,),
    );
  }
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      getBloc().add(JobImageAddedClickedEvent(filePath: result.files.single.path!));

    }
  }

}