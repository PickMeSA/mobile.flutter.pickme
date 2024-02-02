
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
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/alternative_request_response_bloc.dart';

@RoutePage()
class AlternativeRequestResponsePage extends BasePage {
  bool approved = false;
  BookingEntity booking;
   AlternativeRequestResponsePage({required this.approved,required this.booking,super.key});

  @override
  _AlternativeRequestResponsePageState createState() => _AlternativeRequestResponsePageState();
}

class _AlternativeRequestResponsePageState extends BasePageState<AlternativeRequestResponsePage, AlternativeRequestResponseBloc> {

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
    return BlocConsumer<AlternativeRequestResponseBloc, AlternativeRequestResponsePageState>(
      listener: (context, state){
        if( state is RescheduleBookingState && state.dataState == DataState.success){
          context.router.pushAndPopUntil(
              BottomNavigationBarRoute(
              initialIndex: 1), predicate: (Route<dynamic> route) => false);

        }

        if( state is RescheduleBookingState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if( state is RescheduleBookingState && state.dataState == DataState.loading){
          preloader(context);
        }
      },
      builder: (context, state){
        ThemeData theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wText(!widget.approved?getLocalization().alternativeRequestDeclined: getLocalization().alternativeRequestAccepted,style:theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.black
              )),
              20.height,
              wText(widget.approved? getLocalization().youveApprovedTheAlternativeRequest:getLocalization().youveDeclinedTheAlternativeRequest),
              20.height,
              SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(child: Image.asset(widget.approved?
                      'assets/reschedule_accepted.png':
                      'assets/reschedule_declined.png')),
                    ],
                  )
              ),
              40.height,
              !widget.approved?
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                return BorderSide(
                                  color:
                                  Colors.white,
                                  width: 2,
                                );
                              }
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states){
                                    return
                                      theme.colorScheme.secondary;
                                  }
                              )
                          ),
                          onPressed: () {
                            context.router.push( ProposeAlternativeRoute(bookingId: widget.booking!));
                          },
                          child: Text(getLocalization().proposeAlternative, style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
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
                            getBloc().add(RescheduleBookingEvent(rescheduleEntity:
                            RescheduleEntity(
                              previousStatus: widget.booking!.previousStatus,
                              proposedAltStartDate: "",
                                proposedAltStartTime: "",
                                startTime: widget.booking?.job.startTime??"",
                                jobInterestId: widget.booking?.id??"",
                                reasonForChange: widget.booking?.reasonForChange??"",
                                startDate: widget.booking!.startDate!,
                                comments: widget.booking!.comments,
                                status: widget.booking!.previousStatus,
                                proposerUid: widget.booking!.proposerUid
                            )));
                          },
                          child: Text(getLocalization().backToBooking,
                            style: TextStyle(color: theme.colorScheme.secondary),),
                        ),
                      ),
                    ],
                  ),
                ],
              ):
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
                        if(!widget.approved)
                        getBloc().add(RescheduleBookingEvent(rescheduleEntity:
                        RescheduleEntity(
                            previousStatus: widget.booking!.previousStatus,
                            proposedAltStartDate: "",
                            proposedAltStartTime: "",
                            startTime: widget.booking?.job.startTime??"",
                            jobInterestId: widget.booking?.id??"",
                            reasonForChange: widget.booking?.reasonForChange??"",
                            startDate: widget.booking!.startDate!,
                            comments: widget.booking!.comments,
                            status: widget.booking!.previousStatus,
                            proposerUid: widget.booking!.proposerUid
                        )));
                        if(widget.approved)
                          context.router.pushAndPopUntil(
                              BottomNavigationBarRoute(
                                  initialIndex: 1), predicate: (Route<dynamic> route) => false);

                      },
                      child: Text(getLocalization().backToBooking,
                        style: TextStyle(color: theme.colorScheme.secondary),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )  ,
    );
  },
    );
  }


  @override
  AlternativeRequestResponseBloc initBloc() {
    return locator<AlternativeRequestResponseBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
