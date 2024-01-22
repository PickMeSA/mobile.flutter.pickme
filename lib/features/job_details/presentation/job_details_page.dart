
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
import 'package:pickme/shared/widgets/w_client_widget.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/job_details_bloc.dart';

@RoutePage()
class JobDetailsPage extends BasePage {
  int? fromIndex ;
  final String jobId;
  String? bookingId;

   JobDetailsPage({super.key, this.fromIndex = 0, required this.jobId, this.bookingId});

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends BasePageState<JobDetailsPage, JobDetailsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(GetFullJobDetailsEvent(jobId: widget.jobId));
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<JobDetailsBloc, JobDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: SizedBox(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Row(
                     children: [
                       InkWell(onTap: ()=> context.router.pop(),child: const Icon(Iconsax.arrow_left)),
                       20.width,
                       wText(getLocalization().jobDetails, style: theme.textTheme.subtitle1),
                       const Spacer(),
                       const Icon(Icons.bookmark_border_rounded, size: 30,)
                     ],
                   ),
                   30.height,
                   AppTabBar(
                     viewHeight:1500,
                     tabs: <Widget>[
                       Text(getLocalization().client, style: theme.textTheme.bodySmall,),
                       Text(getLocalization().description, style: theme.textTheme.bodySmall,),

                     ],
                     views:  <Widget>[
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           WClientWidget(
                             context: context,
                             areaLocation: "Area/Location",
                             clientName: "Client Name",
                             rating: 4,
                             seeReviews: getLocalization().seeReviews
                           ),

                         AppDivider(),
                           20.height,
                           wText(getLocalization().iAmLookingFor, style: theme.textTheme.titleMedium),
                           20.height,
                           wText(getLocalization().exampleText,),
                           20.height,
                           widget.fromIndex == 0 ?
                           PrimaryButton(
                             width: MediaQuery.sizeOf(context).width,
                             style: ButtonStyle(
                                 side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                   return BorderSide(
                                     color: theme.colorScheme.primary,
                                     width: 2,
                                   );
                                 }
                                 ),
                                 backgroundColor: MaterialStateProperty.resolveWith(
                                         (Set<MaterialState> states){
                                       return theme.colorScheme.primary;
                                     }
                                 )
                             ),
                             onPressed:() {
                               context.router.push(ApplyForJobRoute());
                             },
                             child: Text(getLocalization().apply),
                           ):
                           widget.fromIndex == 1?
                           Column(
                             children: [
                               SecondaryButtonDark(
                                 width: MediaQuery.sizeOf(context).width,
                                 style: ButtonStyle(
                                     side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                       return BorderSide(
                                         color: theme.colorScheme.secondary,
                                         width: 2,
                                       );
                                     }
                                     ),
                                     backgroundColor: MaterialStateProperty.resolveWith(
                                             (Set<MaterialState> states){
                                           return theme.colorScheme.secondary;
                                         }
                                     )
                                 ),
                                 onPressed:() {
                                    context.router.push( RescheduleBookingRoute(
                                        bookingId: widget.bookingId!));
                                 },
                                 child: Text(getLocalization().rescheduleBooking, style: const TextStyle(color: Colors.white)),
                               ),
                               20.height,
                               SecondaryButtonDark(
                                 width: MediaQuery.sizeOf(context).width,
                                 style: ButtonStyle(
                                     side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                       return BorderSide(
                                         color: theme.colorScheme.secondary,
                                         width: 2,
                                       );
                                     }
                                     ),
                                     backgroundColor: MaterialStateProperty.resolveWith(
                                             (Set<MaterialState> states){
                                           return Colors.white;
                                         }
                                     )
                                 ),
                                 onPressed:() {
                                    context.router.push(CancelBookingRoute(bookingId: widget.bookingId!));
                                 },
                                 child: Text(getLocalization().cancelBooking, style: TextStyle(color: theme.colorScheme.secondary,)),
                               )
                             ],
                           ):SizedBox(),
                         ],
                       ),
                       ListView(
                         physics: const NeverScrollableScrollPhysics(),
                         children: [
                           AppJobDetailCard(
                             elevation: 0,
                             padding: EdgeInsets.zero,
                             jobName: "Job Name",
                             employerName: "Company/individual name",
                             locationName: "location/PickMe pickup point",
                             dateTime: DateTime.now(),
                             onNext: (){},
                             estimatedTime: "Est. 9.0 hours",
                             rate: "R400.00",),
                           AppDivider(),
                           20.height,
                           wText(getLocalization().jobDescription, style: theme.textTheme.titleMedium),
                           20.height,
                           wText(getLocalization().exampleText,),
                           20.height,
                           AppDivider(),
                           20.height,
                           wText(getLocalization().skillsRequired, style: theme.textTheme.titleMedium),
                           20.height,
                           SizedBox(height: 200,
                             child: ChipGroup(inputs: [
                               ChipOption(label: "Skill One chip", id: 0),
                               ChipOption(label: "Skill One chip", id: 1),
                               ChipOption(label: "Skill One chip", id: 2),
                               ChipOption(label: "Skill One chip", id: 3),
                               ChipOption(label: "Skill One chip", id: 4),
                             ],
                               onDeleted: (int index){
                               },),
                           ),
                           AppDivider(),
                           20.height,
                           wText(getLocalization().photos, style: theme.textTheme.titleMedium),
                           20.height,
                           Row(
                             children: [
                               Container(
                                 width: (MediaQuery.sizeOf(context).width / 2) - 30,
                                 height: 200,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(30))
                                 ),
                                 child: Placeholder(
                                 ),
                               ),
                               20.width,
                               Container(
                                 width: (MediaQuery.sizeOf(context).width / 2) - 30,
                                 height: 200,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(30))
                                 ),
                                 child: Placeholder(
                                 ),
                               ),
                             ],
                           ),
                           20.height,
                           AppDivider(),
                           20.height,
                           SecondaryButtonDark(
                             width: MediaQuery.sizeOf(context).width,
                             style: ButtonStyle(
                                 side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                   return BorderSide(
                                     color: theme.colorScheme.secondary,
                                     width: 2,
                                   );
                                 }
                                 ),
                                 backgroundColor: MaterialStateProperty.resolveWith(
                                         (Set<MaterialState> states){
                                       return theme.colorScheme.secondary;
                                     }
                                 )
                             ),
                             onPressed:() {
                               context.router.push(PaySomeoneWebViewRoute());
                             },
                             child: Text(getLocalization().apply),
                           ),
                           20.height,

                           widget.fromIndex == 0 ?
                           PrimaryButton(
                             width: MediaQuery.sizeOf(context).width,
                             style: ButtonStyle(
                                 side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                   return BorderSide(
                                     color: theme.colorScheme.primary,
                                     width: 2,
                                   );
                                 }
                                 ),
                                 backgroundColor: MaterialStateProperty.resolveWith(
                                         (Set<MaterialState> states){
                                       return theme.colorScheme.primary;
                                     }
                                 )
                             ),
                             onPressed:() {
                              context.router.push(ApplyForJobRoute());
                             },
                             child: Text(getLocalization().apply),
                           ):
                           widget.fromIndex == 1?
                           SecondaryButtonDark(
                             width: MediaQuery.sizeOf(context).width,
                             style: ButtonStyle(
                                 side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                   return BorderSide(
                                     color: theme.colorScheme.secondary,
                                     width: 2,
                                   );
                                 }
                                 ),
                                 backgroundColor: MaterialStateProperty.resolveWith(
                                         (Set<MaterialState> states){
                                       return theme.colorScheme.secondary;
                                     }
                                 )
                             ),
                             onPressed:() {
                               context.router.push(ApplyForJobRoute());
                             },
                             child: Text(getLocalization().apply),
                           ):SizedBox(),

                         ],
                       )
                     ], onTap: (int index) {  },
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
  JobDetailsBloc initBloc() {
    return locator<JobDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
