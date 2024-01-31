import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class MyBookingsUpcomingPage extends BasePage {

  const MyBookingsUpcomingPage({super.key});

  @override
  _MyBookingsUpcomingPageState createState() => _MyBookingsUpcomingPageState();
}

class _MyBookingsUpcomingPageState extends BasePageState<MyBookingsUpcomingPage, MyBookingsUpcomingBloc> {
    int? date = 0;
    RefreshController _refreshController =
    RefreshController(initialRefresh: false);
    bool laterFlagged = false;

    void _onRefresh() async{
      // monitor network fetch
      getBloc().add(LoadBookingsUpcomingEvent());
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }

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
    return SmartRefresher(

      controller: _refreshController,
      onRefresh: _onRefresh,
      child: BlocConsumer<MyBookingsUpcomingBloc, MyBookingsUpcomingPageState>(
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
                       TextButton(onPressed: ()=> context.router.push(const BurgerMenuRoute()), child: SvgPicture.asset("assets/menu.svg"))
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
                          itemCount: getBloc().upcomingHireBookingsList.length,
                          physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context , index){
                              return
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(index == 0 && getBloc().upcomingHireBookingsList[index].job.startDate!.difference(DateTime.now()) < const Duration(days: 1))
                                      wText(getLocalization().today),

                                    if(index == 0 && getBloc().upcomingHireBookingsList[index].job.startDate!.difference(DateTime.now()) > const Duration(days: 1) && getLaterThisMonth())
                                      wText(getLocalization().laterThisMonth),


                                    InkWell(
                                  onTap: (){ UserModel userModel = boxUser.get(current);
                                    if(
                                  getBloc().upcomingHireBookingsList[index].status == JobStatus.requestedReschedule
                                  && getBloc().upcomingHireBookingsList[index].proposerUid != userModel.id){
                                      context.router.push(RescheduleRequestRoute(
                                          bookingEntity: getBloc()
                                              .upcomingHireBookingsList[index]));

                                  } else if(getBloc().upcomingHireBookingsList[index].status == JobStatus.alternativeProposed
                                 && getBloc().upcomingHireBookingsList[index].proposerUid != userModel.id){
                                    context.router.push(AlternativeRescheduleRequestRoute(
                                        bookingEntity: getBloc()
                                            .upcomingHireBookingsList[index]));
                                  } else {
                                    context.router.push(JobDetailsRoute(
                                        fromIndex: 1,
                                        jobId: getBloc().upcomingHireBookingsList[index].jobId,
                                        bookingId: getBloc().upcomingHireBookingsList[index]));
                                  }
                                  },
                                      child: AppJobCard(

                                        jobName: getBloc().upcomingHireBookingsList[index].job.title!,
                                        employerName: getBloc().profileEntity?.type == "Worker"?
                                          getBloc().upcomingHireBookingsList[index].job.title??"":
                                        "${getBloc().upcomingHireBookingsList[index].customer?.firstName} "
                                            "${getBloc().upcomingHireBookingsList[index].customer?.surname}",
                                        locationName: getBloc().upcomingHireBookingsList[index].job.address??"",
                                        dateTime: getBloc().upcomingHireBookingsList[index].job.startDate!,
                                        status: getBloc().upcomingHireBookingsList[index].status,
                                        onNext: () { UserModel userModel = boxUser.get(current);
                                        if(
                                        getBloc().upcomingHireBookingsList[index].status == JobStatus.requestedReschedule
                                            && getBloc().upcomingHireBookingsList[index].proposerUid != userModel.id){
                                          context.router.push(RescheduleRequestRoute(
                                              bookingEntity: getBloc()
                                                  .upcomingHireBookingsList[index]));

                                        } else if(getBloc().upcomingHireBookingsList[index].status == JobStatus.alternativeProposed
                                            && getBloc().upcomingHireBookingsList[index].proposerUid != userModel.id){
                                          context.router.push(AlternativeRescheduleRequestRoute(
                                              bookingEntity: getBloc()
                                                  .upcomingHireBookingsList[index]));
                                        } else {
                                          context.router.push(JobDetailsRoute(
                                              fromIndex: 1,
                                              jobId: getBloc().upcomingHireBookingsList[index].jobId,
                                              bookingId: getBloc().upcomingHireBookingsList[index]));
                                        }
                                        },
                                      ),
                                    ),
                                    10.height
                                  ],
                                );

                        }),
                       ListView.builder(
                           itemCount: getBloc().completeHireBookingsList.length,
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (context , index){
                             return
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   if (index == 0)
                                     wText(DateFormatters.toMonthFullWord(getBloc().completeHireBookingsList[index].job.startDate!)),
                                   if(index != 0)
                                     if(getBloc().completeHireBookingsList[index].job.startDate?.month != getBloc().completeHireBookingsList[index -1].job.startDate?.month)
                                       wText(DateFormatters.toMonthFullWord(getBloc().completeHireBookingsList[index].job.startDate!)),
                                   InkWell(
                                     onTap:()=> context.router.push(JobDetailsRoute(
                                         fromIndex: 3,
                                         jobId: getBloc().completeHireBookingsList[index].jobId)),
                                     child: AppJobCard(
                                       jobName: getBloc().completeHireBookingsList[index].job.title!,
                                       employerName: getBloc().profileEntity?.type == "Worker"?
                                       getBloc().completeHireBookingsList[index].job.title??"":
                                       "${getBloc().completeHireBookingsList[index].customer?.firstName} "
                                           "${getBloc().completeHireBookingsList[index].customer?.surname}",
                                       locationName: getBloc().completeHireBookingsList[index].job.address??"",
                                       dateTime: DateTime.now().add(const Duration(days: 5)),
                                       onNext: () {  },
                                     ),
                                   ),
                                   10.height
                                 ],
                               );

                           }),
                       ListView.builder(
                           itemCount: getBloc().cancelledHireBookingsList.length,
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (context , index){
                             return
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   InkWell(
                                     onTap:()=> context.router.push(
                                         JobDetailsRoute(
                                         fromIndex: 2,
                                         jobId: getBloc().cancelledHireBookingsList[index].jobId,
                                           bookingId: getBloc().cancelledHireBookingsList[index]
                                     )),
                                     child: AppJobCard(
                                       jobName: getBloc().cancelledHireBookingsList[index].job.title!,
                                       employerName: getBloc().profileEntity?.type == "Worker"?
                                       getBloc().cancelledHireBookingsList[index].job.title??"":
                                       "${getBloc().cancelledHireBookingsList[index].customer?.firstName} "
                                           "${getBloc().cancelledHireBookingsList[index].customer?.surname}",
                                       locationName: getBloc().cancelledHireBookingsList[index].job.address??"",
                                       dateTime: DateTime.now().add(const Duration(days: 5)),
                                       status: JobStatus.cancelled,
                                       onNext: () => context.router.push(
                                           JobDetailsRoute(
                                               fromIndex: 2,
                                               jobId: getBloc().cancelledHireBookingsList[index].jobId,
                                               bookingId: getBloc().cancelledHireBookingsList[index]
                                           )),
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
      ),
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

  bool getLaterThisMonth(){
      if(laterFlagged){
        laterFlagged = false;
        return true;
      }else{
        return false;
      }
  }


}
