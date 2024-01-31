
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/job_applicant_entity.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_client_widget.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/job_details_bloc.dart';
enum PageMode { booking, searching, jobRequest, hiring}
@RoutePage()
class JobDetailsPage extends BasePage {
  final int? fromIndex ;
  final String jobId;
  final BookingEntity? bookingId;
  final JobEntity? job;
  final PageMode pageMode;

   const JobDetailsPage({super.key, this.fromIndex = 0, required this.jobId, this.pageMode = PageMode.searching, this.bookingId, this.job});

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
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<JobDetailsBloc, JobDetailsPageState>(
      listener: (context, state){
        if(state is GetFullJobDetailsState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is GetFullJobDetailsState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.of(context, rootNavigator: true).pop();
        }
        //error
        if(state is GetFullJobDetailsState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
        if(state is ApplyForJobState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is ApplyForJobState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          context.router.push(const ApplicationSentRoute());
        }
        //error
        if(state is ApplyForJobState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.only(top:0, left: 20.0, right: 20.0, bottom: 20.0),
           child: SizedBox(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height,
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   getBloc().jobEntity == null ?Center(
                     child: Text(getLocalization().loadingDotDot),
                   ):AppTabBar(
                     viewHeight:1500,
                     tabs: <Widget>[
                       if(widget.pageMode != PageMode.hiring)Text(getLocalization().client, style: theme.textTheme.bodySmall,),
                       Text(getLocalization().description, style: theme.textTheme.bodySmall,),
                       if(widget.pageMode == PageMode.hiring)Text("${getLocalization().applications} (${getBloc().jobEntity?.profiles?.length})", style: theme.textTheme.bodySmall,),
                       // if(getBloc().currentUserId == getBloc().jobEntity!.customer.id)
                     ],
                     views:  <Widget>[
                       if(widget.pageMode != PageMode.hiring) Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           WClientWidget(
                             context: context,
                             areaLocation: getBloc().jobEntity!.customer?.address??"",
                             clientName: getBloc().jobEntity!.customer!=null?"${getBloc().jobEntity!.customer?.firstName} ${getBloc().jobEntity!.customer?.surname}":"",
                             rating: getBloc().jobEntity!.customer==null?0:getBloc().jobEntity!.customer!.averageRating??0,
                             seeReviews: getLocalization().seeReviews,
                            profileImage: getBloc().jobEntity!.customer!.profileImage,
                             onSeeReviews: ()=>context.router.push(MyReviewsRoute(userId: getBloc().currentUserId))
                           ),

                         const AppDivider(),
                           20.height,
                           wText(getLocalization().iAmLookingFor, style: theme.textTheme.titleMedium),
                           20.height,
                           wText(getBloc().jobEntity!.description,),
                           20.height,
                           widget.fromIndex == 0 && widget.pageMode!=PageMode.hiring  && ( getBloc().jobEntity!.jobInterestStatus==null || getBloc().jobEntity!.jobInterestStatus!="applied")?
                           PrimaryButton.fullWidth(
                             onPressed:getBloc().jobEntity!.jobInterestStatus!=null?null:() {
                               if(getBloc().jobEntity?.startDate == null){
                                 context.router.push(ApplyForJobRoute(job: getBloc().jobEntity!));
                               }else{
                                 getBloc().add(ApplyForJobEvent());
                               }
                               },
                             child: Text(getBloc().jobEntity!.jobInterestStatus==null?getLocalization().apply:getLocalization().applied),
                           ):
                           widget.fromIndex == 1?
                           Column(
                             children: [
                               if(widget.bookingId?.customer?.id == getBloc().currentUserId)
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
                                      context.router.push(PaySomeoneWebViewRoute(bookingEntity: widget.bookingId ));
                                   },
                                   child: Text(getLocalization().completeBooking, style: const TextStyle(color: Colors.white)),
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
                                           return
                                             widget.bookingId?.customer?.id == getBloc().currentUserId?
                                             Colors.white: theme.colorScheme.secondary;
                                         }
                                     )
                                 ),
                                 onPressed:() {
                                    context.router.push( RescheduleBookingRoute(
                                        bookingId: widget.bookingId!));
                                 },
                                 child: Text(getLocalization().rescheduleBooking, style:  TextStyle(color:
                                 widget.bookingId?.customer?.id == getBloc().currentUserId?
                                 theme.colorScheme.secondary: Colors.white)),
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
                                    context.router.push(CancelBookingRoute(booking:widget.bookingId!));
                                 },
                                 child: Text(getLocalization().cancelBooking, style: TextStyle(color: theme.colorScheme.secondary,)),
                               )
                             ],
                           ):const SizedBox(),
                           getBloc().jobEntity!.jobInterestStatus=="offer"?Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: SecondaryButtonDark(
                                       child: Text(getLocalization().decline),
                                       onPressed: () => getBloc().add(RespondToJobInterestEvent(status: "decline"))
                                   ),
                                 ),
                                 16.width,
                                 Expanded(
                                   child: PrimaryButtonDark(
                                       child: Text(getLocalization().accept),
                                       onPressed: () => getBloc().add(RespondToJobInterestEvent(status: "booked"))
                                   ),
                                 ),
                               ],
                             ),
                           ):SizedBox()
                         ],
                       ),
                       ListView(
                         physics: const NeverScrollableScrollPhysics(),
                         children: [
                           AppJobDetailCard(
                             elevation: 0,
                             padding: EdgeInsets.zero,
                             jobName: getBloc().jobEntity!.title,
                             employerName: "${getBloc().jobEntity!.customer?.firstName} ${getBloc().jobEntity!.customer?.surname}",
                             locationName: "${getBloc().jobEntity!.customer?.address}",
                             dateTime: getBloc().jobEntity!.startDate,
                             onNext: (){},
                             estimatedTime: "${getBloc().jobEntity!.estimatedHours} hrs",
                             rate: "R${getBloc().jobEntity!.hourlyRate} ph",
                             image: (getBloc().jobEntity!.customer?.profileImage!=null)?
                             CachedNetworkImageProvider(getBloc().jobEntity!.customer!.profileImage!):null,),
                           const AppDivider(),
                           20.height,
                           wText(getLocalization().jobDescription, style: theme.textTheme.titleMedium),
                           20.height,
                           wText(getBloc().jobEntity!.description),
                           20.height,
                           const AppDivider(),
                           20.height,
                           wText(getLocalization().skillsRequired, style: theme.textTheme.titleMedium),
                           20.height,
                           ChipGroup(inputs: getBloc().jobEntity!.skills.map((e) => ChipOption(label: e.skill!, id: int.parse(e.id!))).toList()),
                           const AppDivider(),
                           20.height,
                           wText(getLocalization().photos, style: theme.textTheme.titleMedium),
                           20.height,
                           // if(getBloc().jobEntity!.images.isNotEmpty)Padding(
                           //   padding: const EdgeInsets.only(top: 16.0),
                           //   child: Row(
                           //       children: getBloc().jobEntity!.images.split(",").map((e){
                           //         logger.e(e);
                           //         return ImageThumbnail(
                           //           imagePath:e,
                           //         );
                           //       }).toList()),
                           // ),
                           ListView.builder(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: getBloc().jobEntity!.images.split(",").length??0,
                               itemBuilder: (context, index){
                                 List<String> files = getBloc().jobEntity!.images.split(",")??[];
                                 return files == null && files.isEmpty && index != 0 && !index.isOdd ?
                                 const SizedBox():
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(top: 16.0),
                                       child: Row(
                                         children: [
                                           if(index.isEven || index == 0)
                                             Expanded(child: ImageThumbnail(
                                               imagePath:  files?[index],
                                             )),

                                           16.width, // Add some spacing between images
                                           if(files.length == index + 1)
                                             Expanded(child: Container(),),
                                           if(files.length > index + 1 && index.isEven)
                                             Expanded(child: ImageThumbnail(
                                               imagePath:  files[index + 1],
                                             )),
                                         ],
                                       ),
                                     ),
                                   ],
                                 );
                               }),
                           20.height,
                           const AppDivider(),
                           20.height,
                           widget.fromIndex == 0 && widget.pageMode!=PageMode.hiring  && ( getBloc().jobEntity!.jobInterestStatus==null || getBloc().jobEntity!.jobInterestStatus!="applied")?
                           PrimaryButton.fullWidth(
                             onPressed:getBloc().jobEntity!.jobInterestStatus!=null?null:() {
                               if(getBloc().jobEntity?.startDate == null){
                                 context.router.push(ApplyForJobRoute(job: getBloc().jobEntity!));
                               }else{
                                 getBloc().add(ApplyForJobEvent());
                               }
                               },
                             child: Text(getLocalization().apply),
                           ):
                           widget.fromIndex == 1?
                           SecondaryButtonDark.fullWidth(
                             onPressed:() {
                               if(getBloc().jobEntity?.startDate == null){
                                 context.router.push(ApplyForJobRoute(job: getBloc().jobEntity!));
                               }else{
                                 getBloc().add(ApplyForJobEvent());
                               }
                             },
                             child: Text(getLocalization().apply),
                           ):widget.fromIndex == 2?
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
                                 context.router.push(CancellationDetailsRoute(bookingEntity: widget.bookingId!));

                               },
                               child: Text(getLocalization().seeCancellationDetails, style: TextStyle(color: theme.colorScheme.secondary),)):const SizedBox(),
                           getBloc().jobEntity!.jobInterestStatus=="offer"?Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Row(
                               children: [
                                 Expanded(
                                   child: SecondaryButtonDark(
                                       child: Text(getLocalization().decline),
                                       onPressed: () => getBloc().add(RespondToJobInterestEvent(status: "decline"))
                                   ),
                                 ),
                                 16.width,
                                 Expanded(
                                   child: PrimaryButtonDark(
                                       child: Text(getLocalization().accept),
                                       onPressed: () => getBloc().add(RespondToJobInterestEvent(status: "booked"))
                                   ),
                                 ),
                               ],
                             ),
                           ):SizedBox()
                         ],
                       ),
                       if(widget.pageMode == PageMode.hiring)ListView.builder(
                           physics: const NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: getBloc().jobEntity!.profiles?.length??0,
                           itemBuilder: (context, index){
                             CandidateProfileEntity candidate = getBloc().jobEntity!.profiles![index];
                             return AppCandidateProfile(
                               fullName: candidate.fullName??"",
                               jobTitle: getBloc().jobEntity!.title,
                               rating: candidate.rating??0,
                               hourlyRate: "R${candidate.hourlyRate}p/h",
                               image: (candidate.profilePicture!=null)?
                               CachedNetworkImageProvider(
                                   candidate.profilePicture!
                               ):null,
                               viewProfileFunction: (){
                                 context.router.push(CandidateProfileRoute(candidateProfile: candidate, jobInterestId: getBloc().jobEntity!.profiles![index].jobInterestId)).then((value) => getBloc().add(GetFullJobDetailsEvent(jobId: widget.jobId)));
                               },
                             );
                           }),
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
  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().jobDetails.toLowerCase().capitalizeFirstLetter(),),
    );
  }

}
