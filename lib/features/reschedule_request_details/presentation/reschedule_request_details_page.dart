
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/reschedule_booking/domain/entities/reschedule_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';

import 'bloc/reschedule_request_details_bloc.dart';

@RoutePage()
class RescheduleRequestDetailsPage extends BasePage {

  final BookingEntity bookingEntity;
   RescheduleRequestDetailsPage({super.key, required this.bookingEntity});

  @override
  _RescheduleRequestDetailsPageState createState() => _RescheduleRequestDetailsPageState();
}

class _RescheduleRequestDetailsPageState extends BasePageState<RescheduleRequestDetailsPage, RescheduleRequestDetailsBloc> {
  String? name = "";
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
    return BlocConsumer<RescheduleRequestDetailsBloc, RescheduleRequestDetailsPageState>(
      listener: (context, state){
        if(state is RescheduleBookingState && state.dataState == DataState.success){
          Navigator.pop(context);
        }

        if(state is RescheduleBookingState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state is RescheduleBookingState && state.dataState == DataState.loading){
          preloader(context);
        }

      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        if(widget.bookingEntity.proposerUid == widget.bookingEntity.labourerUid){
          name = "Laborer";
        }else{
          name = widget.bookingEntity.customer?.firstName??"";
        }
         return Container(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [

                       InkWell(onTap: ()=> context.router.pop()
                       ,child: Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().rescheduleRequest, style: theme.textTheme.titleLarge),
                     ],
                   ),
                   30.height,
                   wText(getLocalization().needsToRescheduleThisBooking(name!)),
                   50.height,
                   wText(getLocalization().proposedDateAndTime,
                   style: theme.textTheme.titleMedium),
                   40.height,
                   Container(
                     height: 60,
                     color: Colors.grey.shade100,
                     child: Padding(padding: EdgeInsets.all(20),
                     child: Row(
                       children: [
                         wText(DateFormatters.getDayMonthYear(DateTime.parse(widget.bookingEntity.proposedAltStartDate)), style: theme.textTheme.titleLarge),
                         Spacer(),
                         wText(widget.bookingEntity!.proposedAltStartTime!, style: theme.textTheme.titleLarge),
                       ],
                     ),),
                   ),
                   40.height,
                   const AppDivider(),
                   30.height,
                   wText(getLocalization().otherComments,style: theme.textTheme.titleMedium),
                   20.height,
                   wText(widget.bookingEntity.reasonForChange),
                   20.height,
                   const AppDivider(),
                   30.height,
                   wText(getLocalization().proposeAnotherTime,style: theme.textTheme.titleMedium),
                   20.height,
                   wText(getLocalization().notSatisfiedWithTheProposedRescheduleDateAndTime),
                   20.height,
                   InkWell(
                     onTap: ()=> context.router.push(ProposeAlternativeRoute(bookingId: widget.bookingEntity.id)),
                     child: Row(
                       children: [
                         wText(getLocalization().proposeAlternative, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                         10.width,
                         const Icon(Icons.arrow_forward_rounded)
                       ],
                     ),
                   ),
                   10.height,
                   const AppDivider(),
                   20.height,
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
                                       (Set<MaterialState> states){
                                     return
                                       Colors.white;
                                   }
                               )
                           ),
                           onPressed: () {
                              context.router.push( RescheduleSelectionResponseRoute(approved: false, booking: widget.bookingEntity));
                           },
                           child: Text(getLocalization().decline, style: TextStyle(color: theme.colorScheme.secondary),),
                         ),
                       ),
                       10.width,
                       Expanded(
                         child: PrimaryButton(
                           style: ButtonStyle(
                               side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                 return BorderSide(
                                   color:
                                   theme.colorScheme.primary,
                                   width: 2,
                                 );
                               }
                               ),
                               backgroundColor: MaterialStateProperty.resolveWith(
                                       (Set<MaterialState> states){
                                     return
                                       theme.colorScheme.primary;
                                   }
                               )
                           ),
                           onPressed: () {
                             UserModel userModel = boxUser.get(current);
                             getBloc().add(RescheduleBookingEvent(rescheduleEntity: RescheduleEntity(
                                 status: JobStatus.rescheduled,
                                 comments: widget.bookingEntity.comments,
                                 startTime: widget.bookingEntity.proposedAltStartTime,
                                 startDate: widget.bookingEntity.proposedAltStartDate,
                                 reasonForChange: widget.bookingEntity.reasonForChange,
                                 jobInterestId: widget.bookingEntity.id,
                               proposerUid: userModel.id
                             )));
                             //  context.router.push(const BottomNavigationBarRoute());
                           },
                           child: Text(getLocalization().accept, style: TextStyle(color: Colors.white),),
                         ),
                       ),
                     ],
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
  RescheduleRequestDetailsBloc initBloc() {
    return locator<RescheduleRequestDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
