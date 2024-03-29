import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/job_details/presentation/job_details_page.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/display_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
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
    bool laterFlagged = true;
    bool todayFlagged = true;
    bool olderFlagged = true;



    void _onRefresh() async{
      // monitor network fetch
      getBloc().add(LoadBookingsUpcomingEvent());
      laterFlagged = true;
      todayFlagged = true;
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
        listener: (context, state){
          if(state.dataState == DataState.error && state is LoadBookingUpcomingState){
            wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
          }
        },
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
                     isScrollable: true,
                     onTap: (index){
                       if(index != 0){
                         laterFlagged = true;
                         todayFlagged = true;
                         olderFlagged = true;
                       }
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
                            itemBuilder: (context , index){
                            DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
                              DateTime dateToCheck = DateTime(
                                  DateTime.parse(getBloc().upcomingHireBookingsList[index].startDate!).year,
                                  DateTime.parse(getBloc().upcomingHireBookingsList[index].startDate!).month,
                                  DateTime.parse(getBloc().upcomingHireBookingsList[index].startDate!).day
                              );
                            UserModel userModel = boxUser.get(current);
                              DisplayEntity displayEntity = userModel.type == 'work'? DisplayEntity(
                                  url: getBloc().upcomingHireBookingsList[index].customer?.profileImage,
                                  surname: getBloc().upcomingHireBookingsList[index].customer?.surname??"",
                                  location: getBloc().upcomingHireBookingsList[index].customer?.address??"",
                                  name: getBloc().upcomingHireBookingsList[index].customer?.firstName??null)
                                  :DisplayEntity(
                                  url: getBloc().upcomingHireBookingsList[index].labourerEntity.profileImage,
                                  surname: getBloc().upcomingHireBookingsList[index].labourerEntity?.surname??"",
                                  location: getBloc().upcomingHireBookingsList[index].labourerEntity?.address??"",
                                  name: getBloc().upcomingHireBookingsList[index].labourerEntity?.firstName??null);

                              return
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(getOlder() && dateToCheck.isBefore(today))
                                      wText(getLocalization().today),
                                    if(getToday() && dateToCheck == today)
                                      wText(getLocalization().today),
                                    if(dateToCheck.isAfter(today) && getLaterThisMonth())
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: wText(getLocalization().upcoming),
                                      ),
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
                                        pageMode: PageMode.booking,
                                        fromIndex: 1,
                                        jobId: getBloc().upcomingHireBookingsList[index].jobId,
                                        bookingId: getBloc().upcomingHireBookingsList[index]));
                                  }
                                  },
                                      child: AppJobCard(

                              time: getBloc().upcomingHireBookingsList[index].status == JobStatus.requestedReschedule
                                  || getBloc().upcomingHireBookingsList[index].status == JobStatus.alternativeProposed
                                  ?getBloc().upcomingHireBookingsList[index].proposedAltStartTime:
                              getBloc().upcomingHireBookingsList[index].startTime
                                        ,jobName: getBloc().upcomingHireBookingsList[index].job.title!,
                                        employerName:
                                        "${displayEntity.name} "
                                            "${displayEntity.surname}",
                                        locationName: getBloc().upcomingHireBookingsList[index].customer?.address??"",
                                        dateTime: getBloc().upcomingHireBookingsList[index].status == JobStatus.requestedReschedule
                                            || getBloc().upcomingHireBookingsList[index].status == JobStatus.alternativeProposed
                              ?DateTime.parse(getBloc().upcomingHireBookingsList[index].proposedAltStartDate)
                                            :DateTime.parse(getBloc().upcomingHireBookingsList[index].startDate!),
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
                                        image: displayEntity.url != null?
                                        CachedNetworkImageProvider(displayEntity.url!):null,
                                      ),
                                    ),
                                    10.height
                                  ],
                                );

                        }),
                       ListView.builder(
                           itemCount: getBloc().completeHireBookingsList.length,
                           itemBuilder: (context , index){
                             UserModel userModel = boxUser.get(current);
                             DisplayEntity displayEntity = userModel.type == 'work'? DisplayEntity(
                                 url: getBloc().completeHireBookingsList[index].customer?.profileImage,
                                 surname: getBloc().completeHireBookingsList[index].customer?.surname??"",
                                 location: getBloc().completeHireBookingsList[index].customer?.address??"",
                                 name: getBloc().completeHireBookingsList[index].customer?.firstName??null)
                                 :DisplayEntity(
                                 url: getBloc().completeHireBookingsList[index].labourerEntity.profileImage,
                                 surname: getBloc().completeHireBookingsList[index].labourerEntity?.surname??"",
                                 location: getBloc().completeHireBookingsList[index].labourerEntity?.address??"",
                                 name: getBloc().completeHireBookingsList[index].labourerEntity?.firstName??null);
                             return

                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   if (index == 0)
                                     wText(DateFormatters.toMonthFullWord(DateTime.parse(getBloc().completeHireBookingsList[index].startDate)!)),
                                   if(index != 0)
                                     if(DateTime.parse(getBloc().completeHireBookingsList[index].startDate)?.month != DateTime.parse(getBloc().completeHireBookingsList[index -1].startDate)?.month)
                                       wText(DateFormatters.toMonthFullWord(DateTime.parse(getBloc().completeHireBookingsList[index].startDate)!)),
                                   InkWell(
                                     onTap:()=> context.router.push(JobDetailsRoute(
                                         pageMode: PageMode.booking,
                                         fromIndex: 3,
                                         jobId: getBloc().completeHireBookingsList[index].jobId)),
                                     child: AppJobCard(

                                       jobName: getBloc().completeHireBookingsList[index].job.title!,
                                       employerName: getBloc().profileEntity?.type == "Worker"?
                                       getBloc().completeHireBookingsList[index].job.title??"":
                                       "${displayEntity.name} "
                                       "${displayEntity.surname}",
                                       locationName: getBloc().completeHireBookingsList[index].job.address??"",
                                       time: getBloc().completeHireBookingsList[index].status == JobStatus.requestedReschedule
                                           || getBloc().completeHireBookingsList[index].status == JobStatus.alternativeProposed
                                           ?getBloc().completeHireBookingsList[index].proposedAltStartTime:
                                       getBloc().completeHireBookingsList[index].startTime,
                                       dateTime: DateTime.parse(getBloc().completeHireBookingsList[index].startDate),
                                       onNext: () {  },
                                       image: displayEntity.url != null?
                                       CachedNetworkImageProvider(displayEntity.url!):null,
                                     ),
                                   ),
                                   10.height
                                 ],
                               );

                           }),
                       ListView.builder(
                           itemCount: getBloc().cancelledHireBookingsList.length,
                           itemBuilder: (context , index){
                             UserModel userModel = boxUser.get(current);
                             DisplayEntity displayEntity = userModel.type == 'work'? DisplayEntity(
                                 url: getBloc().cancelledHireBookingsList[index].customer?.profileImage,
                                 surname: getBloc().cancelledHireBookingsList[index].customer?.surname??"",
                                 location: getBloc().cancelledHireBookingsList[index].customer?.address??"",
                                 name: getBloc().cancelledHireBookingsList[index].customer?.firstName??null)
                                 :DisplayEntity(
                                 url: getBloc().cancelledHireBookingsList[index].labourerEntity.profileImage,
                                 surname: getBloc().cancelledHireBookingsList[index].labourerEntity?.surname??"",
                                 location: getBloc().cancelledHireBookingsList[index].labourerEntity?.address??"",
                                 name: getBloc().cancelledHireBookingsList[index].labourerEntity?.firstName??null);
                             return
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   InkWell(
                                     onTap:()=> context.router.push(
                                         JobDetailsRoute(
                                           pageMode: PageMode.booking,
                                         fromIndex: 2,
                                         jobId: getBloc().cancelledHireBookingsList[index].jobId,
                                           bookingId: getBloc().cancelledHireBookingsList[index]
                                     )),
                                     child: AppJobCard(
                                       jobName: getBloc().cancelledHireBookingsList[index].job.title!,
                                       employerName: getBloc().profileEntity?.type == "Worker"?
                                       getBloc().cancelledHireBookingsList[index].job.title??"":
                                       "${displayEntity.name} ${displayEntity.surname}",
                                       locationName: getBloc().cancelledHireBookingsList[index].job.address??"",
                                       dateTime: DateTime.parse(getBloc().cancelledHireBookingsList[index].startDate),
                                       time: getBloc().cancelledHireBookingsList[index].status == JobStatus.requestedReschedule
                                           || getBloc().cancelledHireBookingsList[index].status == JobStatus.alternativeProposed
                                           ?getBloc().cancelledHireBookingsList[index].proposedAltStartTime:
                                       getBloc().cancelledHireBookingsList[index].startTime,
                                       status: JobStatus.cancelled,
                                       onNext: () => context.router.push(
                                           JobDetailsRoute(
                                               fromIndex: 2,
                                               jobId: getBloc().cancelledHireBookingsList[index].jobId,
                                               bookingId: getBloc().cancelledHireBookingsList[index]
                                           )),
                                       image: displayEntity.url != null?
                                       CachedNetworkImageProvider(displayEntity.url!):null,
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

    bool getOlder(){
      if(olderFlagged){
        olderFlagged = false;
        return true;
      }else{
        return false;
      }
    }


    bool getToday(){
      if(todayFlagged){
        todayFlagged = false;
        return true;
      }else{
        return false;
      }
    }

}
