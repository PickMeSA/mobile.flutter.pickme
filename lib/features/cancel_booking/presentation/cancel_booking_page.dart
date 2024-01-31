
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/cancel_booking/domain/entites/cancel_entity.dart';
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
import 'package:pickme/utils/date_formaters.dart';

import 'bloc/cancel_booking_bloc.dart';

@RoutePage()
class CancelBookingPage extends BasePage {
  const CancelBookingPage({super.key, required this.booking});
  final BookingEntity booking;

  @override
  _CancelBookingPageState createState() => _CancelBookingPageState();
}

class _CancelBookingPageState extends BasePageState<CancelBookingPage, CancelBookingBloc> {


  TextEditingController reasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
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
    return BlocConsumer<CancelBookingBloc, CancelBookingPageState>(
      listener: (context, state){
        if(state is CancelBookingClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.pushAndPopUntil(
              BottomNavigationBarRoute(
                  initialIndex: 1), predicate: (Route<dynamic> route) => false);
        }
        if(state is CancelBookingClickedState && state.dataState == DataState.loading){
          preloader(context);
        }
        if(state is CancelBookingClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        InkWell(onTap: ()=> context.router.pop()
                            ,child: Icon(Icons.arrow_back_rounded)),
                        20.width,
                        wText(getLocalization().cancelBooking, style: theme.textTheme.titleLarge),
                      ],
                    ),
                    30.height,
                    wText(getLocalization().needToCancelYourBooking),
                    50.height,
                    wText(getLocalization().reasonForCancellation,
                        style: theme.textTheme.titleMedium),
                    40.height,
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: AppDropdownMenu(
                        controller: reasonController,
                        label: wText(getLocalization().selectAReason),
                        enableFilter: true,
                        dropdownMenuEntries:getBloc().cancelReasonEntries??[],
                        width: MediaQuery.of(context).size.width-40,),
                    ),
                    20.height,
                    AppTextFormField(
                        controller: commentController,
                        keyboardType: TextInputType.multiline,
                        labelText: getLocalization().otherCommentsOptional,
                        textFieldType: TextFieldType.USERNAME,
                        maxLines: 10,maxLength: 2000),
                    50.height,
                    Row(
                      children: [

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
                              if(_key.currentState!.validate()){
                                getBloc().add(CancelBookingClickedEvent(rescheduleEntity:
                                RescheduleEntity(
                                  previousStatus: JobStatus.cancelled,
                                  proposedAltStartDate: "",
                                    proposedAltStartTime: "",
                                    startTime: widget.booking?.job.startTime??"",
                                    jobInterestId: widget.booking?.id??"",
                                    reasonForChange: reasonController.text??"",
                                    startDate: widget.booking!.startDate!,
                                    comments: commentController.text??"",
                                    status: JobStatus.cancelled,
                                    proposerUid: widget.booking!.proposerUid
                                ) ));
                              }
                              //context.router.push(const AlternativeRequestDetailsRoute());
                            },
                            child: Text(getLocalization().cancelBooking, style: const TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    )


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
  CancelBookingBloc initBloc() {
    return locator<CancelBookingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
