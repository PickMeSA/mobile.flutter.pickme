
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/home_bloc.dart';

@RoutePage()
class HomePage extends BasePage {
   HomePage({required this.controller,super.key});
  final  PersistentTabController controller ;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeBloc> {
late ProfileModel profileModel;
  @override
  void initState() {
    super.initState();
  profileModel = boxProfile.get(current);
  getBloc().add(LoadJobsInAreaEvent());
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {

    ThemeData theme = Theme.of(context);
    return BlocConsumer<HomeBloc, HomePageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
           width: MediaQuery.sizeOf(context).width,
           height: MediaQuery.sizeOf(context).height,
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   height: 300,
                   decoration: BoxDecoration(
                     color: theme.primaryColor,
                     borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(30),
                     bottomRight: Radius.circular(30)),

                   ),
                   child: Stack(

                     children: [
                       Positioned(bottom: 0, right :0,child: Image.asset("assets/Vector.png",)),

                       Positioned(bottom: 0, right :0,child: Image.asset("assets/dashboard_man.png",)),

                       Padding(
                         padding: const EdgeInsets.only(left: 20.0, right: 20, top :70),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 const CircleAvatar(
                                 radius: 25,
                                 backgroundColor: Colors.white,
                                 ),
                                 const Spacer(),

                                 InkWell(onTap: (){
                                   context.router.push(const BurgerMenuRoute());
                                 },
                                 child: const Icon(Iconsax.menu_1,color: Colors.white,)),
                               ],
                             ),
                             SizedBox(height: 20,),
                             wText(
                                 getLocalization().hi(profileModel.firstName!, profileModel.surname!)
                                 ,style: theme.textTheme.headlineSmall?.copyWith(
                                 color: Colors.white,
                                 fontWeight: FontWeight.w500)),
                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Card(
                           elevation: 8,
                           child: ListTile(
                             leading: Icon(Iconsax.briefcase),
                             title: wText(getLocalization().yourNextAppointment),
                             trailing: Icon(Icons.arrow_forward,size: 20,),
                           ),
                         ),
                         const SizedBox(height: 20,),
                         wText(getLocalization().forYou),
                         const SizedBox(height: 20,),

                         Row(
                           children: [
                             SizedBox(
                               height: 230,
                               width: (MediaQuery.sizeOf(context).width/ 2) - 25,
                               child: AppSectionCard(title: getLocalization().myBookings,
                                 onClick: ()=> widget.controller.jumpToTab(1),
                                 color: WColors.pickMeBlue,
                                 icon:Icon(Iconsax.calendar, color: Colors.white,size: 20) ,
                               ),
                             ),
                             10.width,
                             InkWell(
                               onTap: ()=>context.router.push(MyWalletRoute()),
                               child: SizedBox(
                                 height: 230,
                                 width: (MediaQuery.sizeOf(context).width/ 2) - 25,
                                 child: AppSectionCard(title: getLocalization().myWallet,
                                   color: theme.primaryColor,
                                   icon:Icon(Iconsax.wallet, color: Colors.white,size: 20) ,
                                   ),
                               ),
                             ),
                           ],
                         ),

                         wText(getLocalization().myCalendar),
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
                       ),),
                         30.height,
                         getBloc().JobsInAreaList.isNotEmpty?
                         Row(
                           children: [
                             wText(getLocalization().inYourArea),
                             Spacer(),
                             wText(getLocalization().seeAll,
                                 style: theme.textTheme.labelSmall?.copyWith(
                                     color: Colors.black)),
                             10.width,
                             const Icon(Icons.arrow_forward,size: 15,color: Colors.grey,)
                           ],
                         ):
                         20.height,
                         getBloc().JobsInAreaList.isNotEmpty?
                         SizedBox(
                           height: 500,
                           child: ListView.builder(
                               itemCount: getBloc().JobsInAreaList.length,
                               itemBuilder: (context , index){
                                 return
                                   Column(
                                     children: [
                                       InkWell(
                                         onTap: ()=> context.router.push(JobDetailsRoute(jobId: getBloc().JobsInAreaList[index].id??"")),
                                         child: AppJobAdvertCard(
                                           jobName: 'Tax Preparation',
                                           employerName: 'DVT',
                                           locationName: 'PickMe',
                                           dateTime: DateTime.now().add(const Duration(days: 5)),
                                           status: JobStatus.applied,
                                           onNext: () {
                                             context.router.push(JobDetailsRoute(jobId: ""));
                                           },
                                         ),
                                       ),
                                       10.height
                                     ],
                                   );

                               }),
                         ):
                             const SizedBox()



                       ],
                     ),
                   ),
                 )
               ],
             ),
           ),
          );
      },
    );
  }


  @override
  HomeBloc initBloc() {
    return locator<HomeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
