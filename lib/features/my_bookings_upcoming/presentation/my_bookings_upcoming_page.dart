import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:intl/intl.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/my_bookings_upcoming_bloc.dart';

@RoutePage()
class MyBookingsUpcomingPage extends BasePage {
  const MyBookingsUpcomingPage({super.key});

  @override
  _MyBookingsUpcomingPageState createState() => _MyBookingsUpcomingPageState();
}

class _MyBookingsUpcomingPageState extends BasePageState<MyBookingsUpcomingPage, MyBookingsUpcomingBloc> {







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
                     Icon(Iconsax.calendar_2),
                     10.width,
                     wText(getLocalization().myBookings, style: theme.textTheme.headlineSmall?.copyWith()),
                     Spacer(),
                     InkWell(
                       child: Icon(Iconsax.menu),
                     ),

                   ],
                 ),
                 30.height,
           Card(
             child: Container(
               padding:EdgeInsets.all(20),
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
                           onTap: ()=> getBloc().add(CalendarMonthIncrementEvent()),
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
                   customGridViewPhysics: NeverScrollableScrollPhysics(),

                   showHeader: false,
                   selectedDayTextStyle: const TextStyle(
                     color: Colors.white,
                   ),
                   minSelectedDate: getBloc().currentDate.subtract(Duration(days: 360)),
                   maxSelectedDate: getBloc().currentDate.add(Duration(days: 360)),
                   onCalendarChanged: (DateTime date) {
                     getBloc().add(CalendarChangedEvent(dateTime: date));
                   },
                 weekendTextStyle: TextStyle(color: Colors.black),
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
                        itemCount: 5,
                        physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context , index){
                            return
                              Column(
                                children: [
                                  InkWell(
                                onTap: ()=> context.router.push(JobDetailsRoute(fromIndex: 1)),
                                    child: AppJobCard(
                                      jobName: 'Tax Preparation',
                                      employerName: 'DVT',
                                      locationName: 'PickMe',
                                      dateTime: DateTime.now().add(const Duration(days: 5)),
                                      status: JobStatus.applied,
                                      onNext: () {
                                        context.router.push(JobDetailsRoute(fromIndex: 1));
                                      },
                                    ),
                                  ),
                                  10.height
                                ],
                              );

                      }),
                     ListView.builder(
                         itemCount: 2,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context , index){
                           return
                             Column(
                               children: [
                                 InkWell(
                                   onTap:()=> context.router.push(JobDetailsRoute(fromIndex: 2)),
                                   child: AppJobCard(
                                     jobName: 'Tax Preparation',
                                     employerName: 'DVT',
                                     locationName: 'PickMe',
                                     dateTime: DateTime.now().add(const Duration(days: 5)),
                                     status: JobStatus.applied,
                                     onNext: () {  },
                                   ),
                                 ),
                                 10.height
                               ],
                             );

                         }),
                     ListView.builder(
                         itemCount: 4,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context , index){
                           return
                             Column(
                               children: [
                                 AppJobCard(
                                   jobName: 'Tax Preparation',
                                   employerName: 'DVT',
                                   locationName: 'PickMe',
                                   dateTime: DateTime.now().add(const Duration(days: 5)),
                                   status: JobStatus.applied,
                                   onNext: () {  },
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
