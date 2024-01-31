import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/create_job_page_job_entity.dart';
import 'package:pickme/features/jobs/shared/features/skills/domain/entities/skill_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/functions/required_text_validator.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_labeled_panel.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/create_job_listing_bloc.dart';

@RoutePage()
class CreateJobListingPage extends BasePage {
  const CreateJobListingPage({super.key, this.candidateToOffer});
  final CandidateProfileEntity? candidateToOffer;

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
  final ScrollController _scrollController = ScrollController();
  DateTime? startDate;
  DateTime? endDate;
  String address = "";

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
        if(state is GetSkillsListState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }

        }
        if(state is GetSkillsListState && state.dataState == DataState.success){
          if(getBloc().preloaderActive){
            getBloc().preloaderActive = false;
            Navigator.pop(context);
          }
          setState(() {
            address = getBloc().currentUser!.location?.address??"";
          });
        }
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
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
        if(state is SkillSelectedState && state.dataState == DataState.success){
          _scrollToBottom();
        }
        if(state is FlexibleHoursChangedState && state.dataState == DataState.success){
          setState(() {
            startDate = null;
            endDate = null;
            startTimeTextController.text = "";
            startDateController.text = "";
            endDateController.text = "";
          });
        }
        if(state is JobImageAddedState && state.dataState == DataState.error){
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {

        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                padding: wPagePadding(top:0),
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
                      const AppDivider(),
                      16.height,
                      Text(getLocalization().location, style: theme.textTheme.bodyMedium!.copyWith(
                          fontVariations: 600.fontWeight
                      ),),
                      16.height,
                      InputChip(
                        color: MaterialStateProperty.resolveWith((states) => (getBloc().locationSource == LocationSource.profile)?neutrals100Color:whiteColor),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Iconsax.location),
                                16.width,
                                Expanded(child: Text(getLocalization().locationAreaBasedOnProfile)),
                                16.width,
                                if(getBloc().locationSource == LocationSource.profile)const Icon(Icons.close)
                              ],
                            ),
                          ),
                        onPressed: () => getBloc().add(LocationFromProfileToggledEvent(locationSource: LocationSource.profile)),
                      ),
                      // InputChip(
                      //   color: MaterialStateProperty.resolveWith((states) => (getBloc().locationSource == LocationSource.currentLocation)?neutrals100Color:whiteColor),
                      //   label: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Row(
                      //       children: [
                      //         const Icon(Iconsax.map),
                      //         16.width,
                      //         Expanded(child: Text(getLocalization().useMyCurrentLocation)),
                      //         16.width,
                      //         if(getBloc().locationSource == LocationSource.currentLocation)const Icon(Icons.close)
                      //       ],
                      //     ),
                      //   ),
                      //   onPressed: () => getBloc().add(LocationFromProfileToggledEvent(locationSource: LocationSource.currentLocation)),
                      // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: [
                              AppCenteredDivider(text: getLocalization().or),
                              16.height,
                              InputChip(
                                color: MaterialStateProperty.resolveWith((states) => (getBloc().locationSource == LocationSource.map)?neutrals100Color:whiteColor),
                                label: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(Iconsax.map_1),
                                      16.width,
                                      Expanded(child: Text(getLocalization().choosePickupPoint)),
                                      16.width,
                                      if(getBloc().locationSource == LocationSource.map)const Icon(Icons.close)
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  getBloc().add(LocationFromProfileToggledEvent(locationSource: LocationSource.map));
                                   showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog.fullscreen(
                                      child: getMapWindow(),
                                    ),
                                  );
                                },
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
                                    child: DateTextBox(
                                      firstDate: DateTime.now(),
                                      lastDate: endDate,
                                      labelText: getLocalization().startDate,
                                      controller: startDateController,
                                      onDateSelected: (DateTime dateTime){
                                        startDate = dateTime;
                                        startDateController.text = dateTime.toDDMMYYYY();
                                        getBloc().add(DateChangedEvent());
                                      },),
                                  ),
                                  8.width,
                                  Expanded(
                                    child: DateTextBox(
                                      firstDate: DateTime.now(),
                                      initialDate: startDate?.add(const Duration(days: 1))??DateTime.now(),
                                      labelText: getLocalization().endDate,
                                      hint: getLocalization().endDate,
                                      controller: endDateController,
                                      onDateSelected: (DateTime dateTime){
                                        endDate = dateTime;
                                        endDateController.text = dateTime.toDDMMYYYY();
                                        getBloc().add(DateChangedEvent());
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
                      Padding(
                        padding: const EdgeInsets.only(top:16, bottom: 140.0),
                        child: ChipGroup(
                          inputs: getBloc().chipOptions.map((e) => ChipOption(label: e.skill!, id: int.parse(e.id!))).toList(),
                          onDeleted: (int index){
                            getBloc().add(SkillChipDeletedEvent(index: index));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color and opacity
                          offset: Offset(0, -4), // Offset to control the direction of the shadow (x, y)
                          blurRadius: 4.0, // Blur radius
                          spreadRadius: 0, // Spread radius
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: PrimaryButtonDark.fullWidth(
                        onPressed: !isValid()?null:(){
                          CreateJobPageJobEntity job =  CreateJobPageJobEntity(
                              title: jobTitleController.text,
                              description: jobDescriptionController.text,
                              address: address,
                              status: 'active',
                              startDate: startDate,
                              endDate: endDate,
                              startTime: startTimeTextController.text,
                              imFlexible: getBloc().flexibleHoursChecked,
                              estimatedHours: hoursTextController.text,
                              lat: getBloc().otpLocationEntity?.latitude.toString()??"",
                              lng: getBloc().otpLocationEntity?.longitude.toString()??"",
                              images: getBloc().photos.map((e) => e.url!).toList(),
                              skills: getBloc().chipOptions
                          );
                          context.router.push(ReviewJobListingInfoRoute(jobEntity: job, profile: getBloc().currentUser!));
                        },
                        child: Text(getLocalization().ccontinue)
                      ),
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
  getMapWindow(){
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        wText(getLocalization().whereAreYouLocated,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
        30.height,
        Container(
          height: 450,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))) ,
          child: PlacePicker(
            apiKey: "AIzaSyAw_cAyNUUBuni6xQi09gNcMFc610lfob8",
            onPlacePicked: (result) {
              getBloc().add(LocationSelectedEvent(otpLocationEntity:getLocation(result)));
              Navigator.pop(context);
            },
            initialPosition: const LatLng(-33.918861, 18.423300),
            useCurrentLocation: true,
            resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
          ),
        ),
        20.height,
        50.height,
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
                onPressed: (){},
                child: Text(getLocalization().save),
              ),
            ),
          ],
        ),
      ],
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
      title: Text(widget.candidateToOffer==null?getLocalization().createAJobListing:getLocalization().createAOneTimeListing,),
    );
  }
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      getBloc().add(JobImageAddedClickedEvent(filePath: result.files.single.path!));

    }
  }

  OTPLocationEntity getLocation(PickResult result){
    if(result.formattedAddress!=null){
      address = result.formattedAddress!;
    }
    ///change this back to string as location comes with id from api.
    return OTPLocationEntity(address: result.adrAddress , latitude: result.geometry?.location.lat, longitude: result.geometry?.location.lng);
  }
  bool isValid(){
    logger.d(_formKey.currentState);
    return
        jobTitleController.text.isNotEmpty &&
        jobDescriptionController.text.isNotEmpty &&
        getBloc().chipOptions.isNotEmpty &&
        getBloc().chipOptions.length<6 &&
        (getBloc().flexibleHoursChecked || (startDate!=null &&
        endDate!=null));
  }

}