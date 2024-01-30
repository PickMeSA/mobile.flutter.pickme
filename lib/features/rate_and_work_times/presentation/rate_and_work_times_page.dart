
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/rates_and_work_times_entity.dart';
import 'package:pickme/features/rate_and_work_times/domain/entities/working_days_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/shared/widgets/w_time_picker.dart';

import 'bloc/rate_and_work_times_bloc.dart';

@RoutePage()
class RateAndWorkTimesPage extends BasePage {
  const RateAndWorkTimesPage({super.key});

  @override
  _RateAndWorkTimesPageState createState() => _RateAndWorkTimesPageState();
}

class _RateAndWorkTimesPageState extends BasePageState<RateAndWorkTimesPage, RateAndWorkTimesBloc> {

  TextEditingController amountTextController  = TextEditingController();
  TextEditingController startTimeTextController = TextEditingController();
  TextEditingController endTimeTextController = TextEditingController();
  TextEditingController workingDayTextController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    ThemeData theme = Theme.of(context);
    return BlocConsumer<RateAndWorkTimesBloc, RateAndWorkTimesPageState>(
      listener: (context, state){
        if( state is SubmitRemoteRateAndWorkTimesState && state.dataState == DataState.success){
          Navigator.pop(context);
          getBloc().preloaderActive = false;
          if(state.profileEntity!.paymentDetails!.bankName!.isEmpty){
            context.router.push(const BankDetailsRoute());
          }else if(state.profileEntity!.location!.address =="" ){
            context.router.push(const LocationRoute());
          }else if(state.profileEntity!.description!.isEmpty){
            context.router.push(const FinalDetailsRoute());
          }else if(!state.profileEntity!.subscriptionPaid!) {
            context.router.push( PaySomeoneWebViewRoute());
          }else{
            context.router.pushAndPopUntil( BottomNavigationBarRoute(profileEntity: state.profileEntity), predicate: (Route<dynamic> route) => false);
          }
        }

        if( state is SubmitRemoteRateAndWorkTimesState && state.dataState == DataState.loading){
          getBloc().preloaderActive = true;
          preloader(context);
        }
        if( state is SubmitRemoteRateAndWorkTimesState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child:SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Form(
                 key: _formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     wText(
                       getLocalization().step4,
                       style: theme.textTheme.headlineLarge!.copyWith(
                         color: theme.primaryColor,
                       ),
                     ),
                     const SizedBox(height: 10,),
                     Row(
                       children: [
                         Expanded(
                           child: wText(
                             getLocalization().whatIsYourHourlyRateAndWorkTimes,
                             style: theme.textTheme.headlineLarge!.copyWith(
                                 fontWeight: FontWeight.w300
                             ),
                           ),
                         ),
                         TertiaryButton(onPressed: (){
                           context.router.push(const MinimumWageRoute());
                         },
                             child: Icon(Icons.info_outline, color: theme.colorScheme.secondary,)
                         )
                       ],
                     ),
                      30.height,
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
                           onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
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
                       onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
                       textFieldType: TextFieldType.NUMBER,
                     labelText: getLocalization().startTime,
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
                       onChanged: (value)=> getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails())),
                       textFieldType: TextFieldType.NUMBER,
                       labelText: getLocalization().endTime,
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
                             getBloc().add(WorkingDaySelectedEvent( workingDaysEntity: selected!));
                             getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails()));
                           },
                           width: MediaQuery.sizeOf(context).width - 40,
                           enableFilter: false,
                           filled: true,
                           dropdownMenuEntries: getBloc().workingDayEntries,
                           label: wText(getLocalization().workingDaysA, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.grey))),
                     ),

                     SizedBox(
                       height: 250 ,
                       child: Center(
                         child: ChipGroup(
                           inputs: getBloc().chipOptions,
                           onDeleted: (int index){
                             getBloc().add(SkillChipDeletedEvent(index: 0));
                             getBloc().add(FormValueChangedEvent(hourRateTimes: getHourRateTimesFormDetails()));
                           },
                         ),
                       ),
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
                           child: PrimaryButtonDark(
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
                             onPressed: !getBloc().checked?null:() {
                               if(_formKey.currentState!.validate()){
                                  getBloc().add(SubmitRemoteRateAndWorkTimesEvent(ratesAndWorkTimesEntity: getHourRateTimesFormDetails()));
                               }
                             },
                             child: Text(getLocalization().nextStep),
                           ),
                         ),
                       ],
                     )
                   ],
                 ),
               ),
             ),
           )  ,
         );
      },
    );
  }


  @override
  RateAndWorkTimesBloc initBloc() {
    return locator<RateAndWorkTimesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


  RatesAndWorkTimesEntity getHourRateTimesFormDetails(){
    return RatesAndWorkTimesEntity(
        hourlyRate: amountTextController.text,
        endTime: endTimeTextController.text,
        startTime: startTimeTextController.text);
  }

}
