
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/RescheduleReasonEntity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';
import 'bloc/reschedule_booking_bloc.dart';

@RoutePage()
class RescheduleBookingPage extends BasePage {
  final BookingEntity bookingId;
  const RescheduleBookingPage({super.key, required this.bookingId});

  @override
  _RescheduleBookingPageState createState() => _RescheduleBookingPageState();
}

class _RescheduleBookingPageState extends BasePageState<RescheduleBookingPage, RescheduleBookingBloc> {

  TextEditingController reasonTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  DateTime dateTime = DateTime.now();

  final GlobalKey<FormState> _key = GlobalKey();

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
    return BlocConsumer<RescheduleBookingBloc, RescheduleBookingPageState>(
      listener: (context, state){
        if(state is RescheduleBookingClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.push(const BookingRescheduleSentRoute());
        }

        if(state is RescheduleBookingClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);

        }

        if(state is RescheduleBookingClickedState && state.dataState == DataState.loading){
          preloader(context);
        }
      },
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: SingleChildScrollView(
             child: SizedBox(
               width: MediaQuery.sizeOf(context).width,
               height: MediaQuery.sizeOf(context).height,
               child: Form(
                 key: _key,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         InkWell(onTap: ()=> context.router.pop(),child: const Icon(Iconsax.arrow_left)),
                         20.width,
                         wText(getLocalization().rescheduleBooking, style: theme.textTheme.subtitle1),
                       ],
                     ),
                     20.height,
                     wText(getLocalization().needToRescheduleSelectAnAlternativeDate,),
                     50.height,
                     wText(getLocalization().reasonForReschedule, style: theme.textTheme.titleMedium),
                     20.height,
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: AppDropdownMenu(
                         controller: reasonTextController,
                         label: wText(getLocalization().selectAReason),
                         enableFilter: true,
                         dropdownMenuEntries:getBloc().rescheduleBookingEntries??[],
                         width: MediaQuery.of(context).size.width-40,),
                     ),
                     50.height,
                     wText(getLocalization().proposedDateAndTime, style: theme.textTheme.titleMedium),
                     20.height,
                     Padding(
                       padding: const EdgeInsets.only(bottom: 10.0),
                       child: DateTextBox(labelText: getLocalization().dateFormat,
                         controller: dateTextController,
                         onDateSelected: (DateTime dateTime){
                           this.dateTime = dateTime;
                           dateTextController.text = DateFormatters.getFullDate(dateTime);
                         },),
                     ),
                     20.height,
                     AppTextFormField(controller: timeTextController,
                       onChanged: (value){} ,
                       textFieldType: TextFieldType.NUMBER,
                       labelText: getLocalization().timeFormat,
                       suffix: InkWell(
                           onTap:() async{
                             TimeOfDay? timeofDay = await showTimePicker(
                                 context: context,
                                 initialTime:  TimeOfDay.now(),
                                 initialEntryMode: TimePickerEntryMode.inputOnly);
                             timeTextController.text =
                             "${timeofDay?.hour}:${timeofDay!.minute < 10? "0${timeofDay?.minute}": timeofDay.minute}";
                           },
                           child: const Icon(Iconsax.clock)),),
                     20.height,
                     AppTextFormField(
                         controller: commentController,
                         keyboardType: TextInputType.multiline,
                         labelText: getLocalization().otherCommentsOptional,
                         textFieldType: TextFieldType.OTHER,
                         maxLines: 10,maxLength: 2000),
                     30.height,
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
                             onPressed: getBloc().checked?null:() {
                               if(_key.currentState!.validate()) {
                                 getBloc().add(RescheduleBookingClickedEvent(
                                     rescheduleEntity: getForm()));
                               }
                             },
                             child: Text(getLocalization().rescheduleBooking),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
              ),
           ),
         );
      },
    );
  }


  @override
  RescheduleBookingBloc initBloc() {
    return locator<RescheduleBookingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  RescheduleEntity getForm(){
    UserModel userModel = boxUser.get(current);
    return RescheduleEntity(
      previousStatus: widget.bookingId.status,
        proposedAltStartTime: timeTextController.text,
        proposedAltStartDate: dateTime.toString() ,
        reasonForChange: reasonTextController.text,
        startTime: widget.bookingId.startTime!,
        comments: commentController.text,
        startDate: widget.bookingId.startDate,
        jobInterestId: widget.bookingId.id,
        status: JobStatus.requestedReschedule,
        proposerUid: userModel.id );
  }


}
