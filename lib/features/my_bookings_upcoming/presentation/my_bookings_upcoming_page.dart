import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';
import 'bloc/my_bookings_upcoming_bloc.dart';

@RoutePage()
class MyBookingsUpcomingPage extends BasePage {

  const MyBookingsUpcomingPage({super.key});

  @override
  _MyBookingsUpcomingPageState createState() => _MyBookingsUpcomingPageState();
}

class _MyBookingsUpcomingPageState extends BasePageState<MyBookingsUpcomingPage, MyBookingsUpcomingBloc> {
    int? date = 0;

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(LoadBookingsUpcomingEvent());
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {

    ThemeData theme = Theme.of(context);
    return BlocConsumer<MyBookingsUpcomingBloc, MyBookingsUpcomingPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Row(
                   children: [
                     const Icon(Iconsax.calendar_2),
                     10.width,
                     wText(getLocalization().myBookings, style: theme.textTheme.headlineSmall?.copyWith()),
                      const Spacer(),
                     const InkWell(
                       child: Icon(Iconsax.menu),
                     ),
                   ],
                 ),
                 30.height,
           Card(
             child: Container(
               padding:const EdgeInsets.all(20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[ // This trailing comma makes auto-formatting nicer for build methods.
                   //custom icon without header
                   Row(
                     children: <Widget>[
                       Expanded(
                           child: Text(
                             getBloc().currentMonth,
                             style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)
                           )),
                       Container(
                         height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(width: 1,color: Colors.black)
                          ),
                         child: InkWell(
                           onTap: ()=> getBloc().add(CalendarMonthDecrementEvent()),
                             child: const Center(child: Icon(Icons.arrow_back_ios_rounded, size: 11,))),
                       ),
                       30.width,
                       Container(
                         height: 24,
                         width: 24,
                         decoration: BoxDecoration(
                             borderRadius: const BorderRadius.all(Radius.circular(8)),
                             border: Border.all(width: 1,color: Colors.black)
                         ),
                         child: InkWell(
                           onTap: ()=> getBloc().add(CalendarMonthIncrementEvent()),
                             child: const Center(child: Icon(Icons.arrow_forward_ios_rounded, size: 11,))),
                       ),
                     ],
                   ),

                   30.height,
                   CalendarCarousel<Event>(

                   onDayPressed: (date, events) {
                     getBloc().add(CalendarDateSelectedEvent(dateTime: date, events: events));
                   },

                   showOnlyCurrentMonthDate: false,
//      firstDayOfWeek: 4,
                   height: 270.0,
                   selectedDateTime: getBloc().currentDate2,
                   targetDateTime: getBloc().targetDateTime,
                   customGridViewPhysics: const NeverScrollableScrollPhysics(),

                   showHeader: false,
                   selectedDayTextStyle: const TextStyle(
                     color: Colors.white,
                   ),
                   minSelectedDate: getBloc().currentDate.subtract(const Duration(days: 360)),
                   maxSelectedDate: getBloc().currentDate.add(const Duration(days: 360)),
                   onCalendarChanged: (DateTime date) {
                     getBloc().add(CalendarChangedEvent(dateTime: date));
                   },
                 weekendTextStyle: const TextStyle(color: Colors.black),
                   ), //
                 ],
               ),
             )
             ),
                 30.height,
                 AppTabBar(
                   onTap: (index){
                   },
                   //viewHeight:192,
                   initialIndex: 0,
                   tabs:  <Widget>[
                      Text(getLocalization().upcoming, style: theme.textTheme.titleSmall?.copyWith(fontSize: 12),),
                     Text(getLocalization().completed, style: theme.textTheme.titleSmall?.copyWith(fontSize: 12),),
                     Text(getLocalization().cancelled, style: theme.textTheme.titleSmall?.copyWith(fontSize: 12),),
                   ],
                   views:  <Widget>[
                      ListView.builder(
                        itemCount: getBloc().upcomingBookingsList.length,
                        physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context , index){
                            return
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (index == 0)
                                    wText(DateFormatters.toMonthFullWord(getBloc().upcomingBookingsList[index].job.startDate!)),
                                  if(index != 0)
                                  if(getBloc().upcomingBookingsList[index].job.startDate?.month != getBloc().upcomingBookingsList[index -1].job.startDate?.month)
                                    wText(DateFormatters.toMonthFullWord(getBloc().upcomingBookingsList[index].job.startDate!)),
                                  InkWell(
                                onTap: (){ UserModel userModel = boxUser.get(current);
                                  if(
                                getBloc().upcomingBookingsList[index].status == JobStatus.requestedReschedule
                                && getBloc().upcomingBookingsList[index].proposerUid != userModel.id){
                                    context.router.push(RescheduleRequestRoute(
                                        bookingEntity: getBloc()
                                            .upcomingBookingsList[index]));

                                } else if(getBloc().upcomingBookingsList[index].status == JobStatus.alternativeProposed
                               && getBloc().upcomingBookingsList[index].proposerUid != userModel.id){
                                  context.router.push(AlternativeRescheduleRequestRoute(
                                      bookingEntity: getBloc()
                                          .upcomingBookingsList[index]));
                                } else {
                                  context.router.push(JobDetailsRoute(
                                      fromIndex: 1,
                                      jobId: getBloc().upcomingBookingsList[index].jobId,
                                      bookingId: getBloc().upcomingBookingsList[index]));
                                }
                                },
                                    child: AppJobCard(

                                      jobName: getBloc().upcomingBookingsList[index].job.title!,
                                      employerName: getBloc().profileEntity?.type == "Worker"?
                                        getBloc().upcomingBookingsList[index].job.title??"":
                                      "${getBloc().upcomingBookingsList[index].customer?.firstName} "
                                          "${getBloc().upcomingBookingsList[index].customer?.surname}",
                                      locationName: getBloc().upcomingBookingsList[index].job.address??"",
                                      dateTime: getBloc().upcomingBookingsList[index].job.startDate!,
                                      status: getBloc().upcomingBookingsList[index].status,
                                      onNext: () {
                                        //context.router.push(JobDetailsRoute(fromIndex: 1));
                                      },
                                    ),
                                  ),
                                  10.height
                                ],
                              );

                      }),
                     ListView.builder(
                         itemCount: getBloc().completeBookingsList.length,
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context , index){
                           return
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 if (index == 0)
                                   wText(DateFormatters.toMonthFullWord(getBloc().completeBookingsList[index].job.startDate!)),
                                 if(index != 0)
                                   if(getBloc().completeBookingsList[index].job.startDate?.month != getBloc().completeBookingsList[index -1].job.startDate?.month)
                                     wText(DateFormatters.toMonthFullWord(getBloc().completeBookingsList[index].job.startDate!)),
                                 InkWell(
                                   onTap:()=> context.router.push(JobDetailsRoute(
                                       fromIndex: 3,
                                       jobId: getBloc().completeBookingsList[index].jobId)),
                                   child: AppJobCard(
                                     jobName: getBloc().completeBookingsList[index].job.title!,
                                     employerName: getBloc().profileEntity?.type == "Worker"?
                                     getBloc().completeBookingsList[index].job.title??"":
                                     "${getBloc().completeBookingsList[index].customer?.firstName} "
                                         "${getBloc().completeBookingsList[index].customer?.surname}",
                                     locationName: getBloc().completeBookingsList[index].job.address??"",
                                     dateTime: DateTime.now().add(const Duration(days: 5)),
                                     onNext: () {  },
                                   ),
                                 ),
                                 10.height
                               ],
                             );

                         }),
                     ListView.builder(
                         itemCount: getBloc().cancelledBookingsList.length,
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context , index){
                           return
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 if (index == 0)
                                   wText(DateFormatters.toMonthFullWord(getBloc().cancelledBookingsList[index].job.startDate!)),
                                 if(index != 0)
                                   if(getBloc().cancelledBookingsList[index].job.startDate?.month != getBloc().cancelledBookingsList[index -1].job.startDate?.month)
                                     wText(DateFormatters.toMonthFullWord(getBloc().cancelledBookingsList[index].job.startDate!)),
                                 InkWell(
                                   onTap:()=> context.router.push(
                                       JobDetailsRoute(
                                       fromIndex: 2,
                                       jobId: getBloc().cancelledBookingsList[index].jobId,
                                         bookingId: getBloc().cancelledBookingsList[index]
                                   )),
                                   child: AppJobCard(
                                     jobName: getBloc().cancelledBookingsList[index].job.title!,
                                     employerName: getBloc().profileEntity?.type == "Worker"?
                                     getBloc().cancelledBookingsList[index].job.title??"":
                                     "${getBloc().cancelledBookingsList[index].customer?.firstName} "
                                         "${getBloc().cancelledBookingsList[index].customer?.surname}",
                                     locationName: getBloc().cancelledBookingsList[index].job.address??"",
                                     dateTime: DateTime.now().add(const Duration(days: 5)),
                                     status: JobStatus.cancelled,
                                     onNext: () {  },
                                   ),
                                 ),
                                 10.height
                               ],
                             );

                         })
                   ],
                 ),

               ],
             ),
           ),
         );
      },
    );
  }


  @override
  MyBookingsUpcomingBloc initBloc() {
    return locator<MyBookingsUpcomingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
