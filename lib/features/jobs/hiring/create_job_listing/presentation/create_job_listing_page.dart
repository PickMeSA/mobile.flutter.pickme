import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_labeled_panel.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/create_job_listing_bloc.dart';

@RoutePage()
class CreateJobListingPage extends BasePage {
  const CreateJobListingPage({super.key});


  @override
  State<CreateJobListingPage> createState() => _MyJobListingsPageState();
}

class _MyJobListingsPageState extends BasePageState<CreateJobListingPage, CreateJobListingBloc> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController hoursTextController = TextEditingController();
  TextEditingController totalFeeTextController = TextEditingController();
  late DateTime startDate;
  late DateTime endDate;
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
        // TODO: implement listener
      },
      builder: (context, state) {

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getLocalization().jobListingDetails, style: theme.textTheme.bodyMedium!.copyWith(
                    fontVariations: 600.fontWeight
                ),),
                24.height,
                Form(
                  child: Column(
                    children: [
                      AppTextFormField(
                        textFieldType: TextFieldType.OTHER,
                        labelText: "${getLocalization().jobName} *",
                      ),
                      16.height,
                      AppTextFormField(
                        textFieldType: TextFieldType.MULTILINE,
                        labelText: "${getLocalization().jobDescription} *",
                        hint: getLocalization().loremIpsumDescriptionField,
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
                              onTap:() async{
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
                AppDropdownMenu<JobsSkillEntity>(
                  leadingIcon: const Icon(Iconsax.add),
                    onSelected: (selected){
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
                )
              ],
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