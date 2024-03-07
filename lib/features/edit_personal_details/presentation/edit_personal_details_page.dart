
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/applying/all_jobs_page/domain/entities/subscription_plan_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_list_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/edit_personal_details_bloc.dart';

@RoutePage()
class EditPersonalDetailsPage extends BasePage {
   ProfileEntity profileEntity;
   EditPersonalDetailsPage({required this.profileEntity,super.key});

  @override
  _EditPersonalDetailsPageState createState() => _EditPersonalDetailsPageState();
}

class _EditPersonalDetailsPageState extends BasePageState<EditPersonalDetailsPage, EditPersonalDetailsBloc> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController workPermitController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController endTimeTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text = widget.profileEntity.firstName??"";
    surnameController.text = widget.profileEntity.surname??"";
    phoneNumberController.text = widget.profileEntity.mobile??"";
    emailAddressController.text = widget.profileEntity.email??"";
    idNumberController.text = widget.profileEntity.idNumber??"";
    passportNumberController.text = widget.profileEntity.passportNumber??"";
    amountTextController.text = widget.profileEntity.hourlyRate.toString()??"0";
    startTimeTextController.text = widget.profileEntity.ratesAndWorkTimesEntity?.startTime??"";
    endTimeTextController.text = widget.profileEntity.ratesAndWorkTimesEntity?.endTime??"";
    workPermitController.text = widget.profileEntity.workPermit??"";
    widget.profileEntity.ratesAndWorkTimesEntity?.workingDaysListEntity?.workingDaysEntityList?.forEach((element) {
      getBloc().add(WorkingDaySelectedEvent(workingDaysEntity: element, profileEntity: widget.profileEntity));
    });

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<EditPersonalDetailsBloc, EditPersonalDetailsPageState>(
      listener: (context, state){
        if(state is UpdatePersonalDetailsState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.pop(state.profileEntity);
        }

        if(state is UpdatePersonalDetailsState && state.dataState == DataState.loading){
          preloader(context);
        }

        if(state is UpdatePersonalDetailsState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: SizedBox(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height,
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       InkWell(onTap: ()=> context.router.pop()
                           ,child: const Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().editDetails, style: theme.textTheme.titleLarge),
                     ],
                   ),
                   20.height,
                   Text(getLocalization().personalDetails),
                   20.height,
                   Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       AppTextFormField(
                         enabled: false,
                         //onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                         // validator: (value)=> validateName(value??""),
                         controller: firstNameController,
                         padding: const EdgeInsets.only(left: 20, right: 20),
                         textFieldType: TextFieldType.NAME, labelText: getLocalization().firstName,),
                       Padding(
                         padding: const EdgeInsets.only( top: 10, bottom:  10),
                         child: AppTextFormField(
                           enabled: false,
                           // onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                           // validator: (value)=> validateSurname(value??""),
                           controller: surnameController,
                           padding: const EdgeInsets.only(left: 20, right: 20,),
                           textFieldType: TextFieldType.NAME, labelText: getLocalization().surname,),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10, bottom:  10),
                         child: AppTextFormField(
                           enabled: false,
                           // onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                           //validator: (value)=> validatePhoneNumber(value??""),
                           prefixIcon: SizedBox(width: 50,
                             child: Row(
                               children: [Text(getLocalization().phonePrefix,)],
                             ),
                           ),
                           controller: phoneNumberController,
                           padding: const EdgeInsets.only(left: 20, right: 20),
                           textFieldType: TextFieldType.NUMBER, labelText: getLocalization().phoneNumber,),
                       ),
                       Padding(
                         padding: const EdgeInsets.only( top: 10, bottom: 10),
                         child: AppTextFormField(
                           enabled: false,
                           //onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                           //validator:(value)=> validateEmailAddress(value??""),
                           controller: emailAddressController,
                           padding: const EdgeInsets.only(left: 20, right: 20),
                           textFieldType: TextFieldType.EMAIL,
                           labelText: getLocalization().emailAddress,),
                       ),
                       if(widget.profileEntity.idNumber != null)
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding:  const EdgeInsets.only( top: 10, bottom:  10),
                               child: AppTextFormField(
                                 enabled: false,
                                 //onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                                 //validator: (value)=> validateIdNumber(value??""),
                                 controller: idNumberController,
                                 padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                                 textFieldType: TextFieldType.NAME, labelText: getLocalization().idNumber,),
                             ),
                             Text(getLocalization().indicatesARequiredField),
                           ],
                         ),
                       if(widget.profileEntity.passportNumber != null)
                         Padding(
                           padding: const EdgeInsets.only( top: 10, bottom:  10),
                           child: AppTextFormField(
                             enabled: false,
                             //onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                             //validator: (value)=> validatePassportNumber(value??""),
                             controller: passportNumberController,
                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom:  5),
                             textFieldType: TextFieldType.NAME, labelText: getLocalization().passportNumberA,),
                         ),
                       if(widget.profileEntity.passportNumber != null)
                       Padding(
                         padding: const EdgeInsets.only( top: 10, bottom:  5),
                         child: AppTextFormField(
                           enabled: false,
                           //onChanged: (value)=> getBloc().add(ValueChangedEvent(userModel: getGetUserModel())),
                           controller: workPermitController,
                           //validator: (value)=> validateWorkPermitNumber(value??""),
                           padding: const EdgeInsets.only(left: 20, right: 20, top: 10,  ),
                           textFieldType: TextFieldType.NAME, labelText: getLocalization().workPermitNumber,),
                       ),

//// end of edit profile fields
                     ],
                   ),
                   20.height,
                   AppDivider(),
                   20.height,
                   Text(getLocalization().myHourlyRateAndWorkingHours),
                   20.height,
                   wText(getLocalization().hourlyRate, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                   10.height,
                   Row(
                     children: [
                       10.width,
                       wText(getLocalization().r,
                           style: theme.textTheme.bodyMedium?.copyWith(
                               fontSize: 32,
                               fontWeight: FontWeight.w600)),
                       30.width,
                       Expanded(child: AppTextFormField(
                        // onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
                         controller:amountTextController,
                         textFieldType: TextFieldType.NUMBER,
                         labelText: getLocalization().noAmount,)),
                       20.height
                     ],
                   ),
                   30.height,
                   wText(getLocalization().workingHours,
                       style: theme.textTheme.bodyMedium?.copyWith(
                           fontWeight: FontWeight.w700)),
                   20.height,
                   AppTextFormField(controller: startTimeTextController,
                    // onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
                     textFieldType: TextFieldType.NUMBER,
                     labelText: getLocalization().startTime,
                     hint: getLocalization().timeHint,
                     readOnly: true,
                     suffix: InkWell(
                         onTap:() async{
                           TimeOfDay? timeofDay = await showTimePicker(
                               context: context,
                               initialTime:  TimeOfDay.now(),
                               initialEntryMode: TimePickerEntryMode.inputOnly);
                           startTimeTextController.text =
                           "${timeofDay?.hour}:${timeofDay!.minute < 10? "0${timeofDay?.minute}": timeofDay.minute}";
                         },
                         child: const Icon(Iconsax.clock)),),
                   10.height,
                   AppTextFormField(controller: endTimeTextController,
                    // onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
                     textFieldType: TextFieldType.NUMBER,
                     labelText: getLocalization().endTime,
                     hint: getLocalization().timeHint,
                     readOnly: true,
                     suffix: InkWell(
                         onTap: ()async{
                           TimeOfDay? timeOfDay = await showTimePicker(
                               context: context,
                               initialTime:  TimeOfDay.now(),
                               initialEntryMode: TimePickerEntryMode.inputOnly);
                           endTimeTextController.text =
                           "${timeOfDay?.hour}:${timeOfDay!.minute < 10? "0${timeOfDay?.minute}": timeOfDay.minute}";;
                         },
                         child: const Icon(Iconsax.clock)),),
                   30.height,
                   wText(getLocalization().workingDays,
                       style: theme.textTheme.bodyMedium?.copyWith(
                           fontWeight: FontWeight.w700)),
                   10.height,
                   Padding(
                     padding: const EdgeInsets.only(top: 10, bottom: 30),
                     child: MultiAppDropdownMenu<WorkingDaysEntity>(
                         onSelected: (selected){
                           getBloc().add(WorkingDaySelectedEvent(profileEntity: widget.profileEntity, workingDaysEntity: selected!));
                           //getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails()));
                         },
                         width: MediaQuery.sizeOf(context).width - 40,
                         enableFilter: false,
                         filled: true,
                         dropdownMenuEntries: getBloc().workingDayEntries,
                         label: wText(getLocalization().workingDaysA, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.grey))),
                   ),

                   SizedBox(
                     height: 150 ,
                     child: Center(
                       child: ChipGroup(
                         inputs: getBloc().chipOptions,
                         onDeleted: (int index){
                           getBloc().add(SkillChipDeletedEvent(index: index));
                          // getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails()));
                         },
                       ),
                     ),
                   ),
                   20.height,
                   if(Platform.isIOS)
                     Row(
                       children: [
                         Expanded(
                           child: PrimaryButton(
                             style: ButtonStyle(
                                 side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                   return BorderSide(
                                     color:
                                     theme.colorScheme.secondary,
                                     width: 2,
                                   );
                                 }
                                 ),
                                 backgroundColor: MaterialStateProperty.resolveWith(
                                         (Set<MaterialState> states) {
                                       return Colors.white;
                                     }
                                 )
                             ),
                             onPressed: getBloc().checked?null:() {
                               context.router.pop();
                             },
                             child: Text(getLocalization().cancel,style: TextStyle(color: Colors.black)),
                           ),
                         ),
                         10.width,
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
                             onPressed: getBloc().checked?null:() {
                               widget.profileEntity.email = emailAddressController.text;
                               widget.profileEntity.ratesAndWorkTimesEntity?.startTime = startTimeTextController.text;
                               widget.profileEntity.ratesAndWorkTimesEntity?.endTime = endTimeTextController.text;
                               widget.profileEntity.ratesAndWorkTimesEntity?.hourlyRate = amountTextController.text;
                               widget.profileEntity.ratesAndWorkTimesEntity?.workingDaysListEntity = WorkingDaysListEntity(workingDaysEntityList: getBloc().selectedDays);
                               getBloc().add(UpdatePersonalDetailsEvent(profileEntity: widget.profileEntity));
                             },
                             child: Text(getLocalization().save),
                           ),
                         ),
                       ],
                     ),
                   20.height,
                   AppDivider(),
                   20.height,
                   Column(
                     children: mockSubscriptionPlans.map((plan) =>
                         AppSubscriptionPlan(
                           price: "${getLocalization().r}${plan.price.toStringAsFixed(2)}",
                           subscriptionType: plan.subscriptionType,
                           entityType: plan.entityType,
                           selected: true,
                           includedItems: plan.includedItems,
                           onInformationClick: ()=>context.router.push(const MembershipInformationRoute()),
                         )).toList(),
                   ),
                   20.height,
                   if(Platform.isAndroid)
                   Row(
                     children: [
                       Expanded(
                         child: PrimaryButton(
                           style: ButtonStyle(
                               side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                 return BorderSide(
                                   color:
                                   theme.colorScheme.secondary,
                                   width: 2,
                                 );
                               }
                               ),
                               backgroundColor: MaterialStateProperty.resolveWith(
                                       (Set<MaterialState> states) {
                                     return Colors.white;
                                   }
                               )
                           ),
                           onPressed: getBloc().checked?null:() {
                             context.router.pop();
                           },
                           child: Text(getLocalization().cancel,style: TextStyle(color: Colors.black)),
                         ),
                       ),
                       10.width,
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
                           onPressed: getBloc().checked?null:() {
                              widget.profileEntity.email = emailAddressController.text;
                              widget.profileEntity.ratesAndWorkTimesEntity?.startTime = startTimeTextController.text;
                              widget.profileEntity.ratesAndWorkTimesEntity?.endTime = endTimeTextController.text;
                              widget.profileEntity.ratesAndWorkTimesEntity?.hourlyRate = amountTextController.text;
                              widget.profileEntity.ratesAndWorkTimesEntity?.workingDaysListEntity = WorkingDaysListEntity(workingDaysEntityList: getBloc().selectedDays);
                              getBloc().add(UpdatePersonalDetailsEvent(profileEntity: widget.profileEntity));
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
  EditPersonalDetailsBloc initBloc() {
    return locator<EditPersonalDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
