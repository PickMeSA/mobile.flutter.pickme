
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
          // if(state)
        }
        //error
        if(state is ApplyForJobState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state is RespondToJobInterestState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is RespondToJobInterestState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          if(getBloc().accepted){
            context.router.push(ReusableNotificationRoute(
                title: getLocalization().youreBookedForTheJob,
                message: getLocalization().youCanKeepTrackOfThisJobInMyBookings,
                button: PrimaryButtonDark.fullWidth(
                    onPressed: ()=>context.router.replace(BottomNavigationBarRoute(initialIndex: 2)),
                    child: Text(getLocalization().backToJobs)),
                image: Image.asset("assets/man_and_woman_celebration.png")
            ));
          }else{
            context.router.replace(BottomNavigationBarRoute(initialIndex: 2));
          }

        }
        //error
        if(state is RespondToJobInterestState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
        if(state is UpdateJobPublishedStatusState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
        //loading
        if(state is UpdateJobPublishedStatusState && state.dataState == DataState.success){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          Navigator.pop(context);
        }
        //error
        if(state is UpdateJobPublishedStatusState && state.dataState == DataState.error){
          getBloc().preloaderActive = false;
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
        if(getBloc().jobEntity != null){
          logger.d(getBloc().jobEntity!.jobInterestStatus);
        }
         return Padding(
           padding: const EdgeInsets.only(top:0, left: 20.0, right: 20.0, bottom: 20.0),
           child: SizedBox(
             width: MediaQuery.sizeOf(context).width,
             height: MediaQuery.sizeOf(context).height,
             child: Column(
               children: [
                 Expanded(child:
                 getBloc().jobEntity == null ?Center(
                   child: Text(getLocalization().loadingDotDot),
                 ):AppTabBar(
                   viewHeight:MediaQuery.sizeOf(context).height-300,
                   isScrollable:true,
                   tabs: <Widget>[
                     if(widget.pageMode != PageMode.hiring)Text(getLocalization().client, style: theme.textTheme.bodySmall,),
                     Text(getLocalization().description, style: theme.textTheme.bodySmall,),
                     if(widget.pageMode == PageMode.hiring)Text("${getLocalization().applications} (${getBloc().jobEntity?.profiles?.length})", style: theme.textTheme.bodySmall,),
                     if(widget.pageMode == PageMode.hiring)Text("${getLocalization().matchingProfiles} (${getBloc().jobEntity?.matches?.length})", style: theme.textTheme.bodySmall,),
                     // if(getBloc().currentUserId == getBloc().jobEntity!.customer.id)
                   ],
                   views:  <Widget>[
                     if(widget.pageMode != PageMode.hiring)
                       SingleChildScrollView(
                         child: Column(
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
                           if(widget.fromIndex == 0 && widget.pageMode!=PageMode.hiring  && ( getBloc().jobEntity!.jobInterestStatus==null || getBloc().jobEntity!.jobInterestStatus!="applied"))
                             PrimaryButton.fullWidth(
                               onPressed:getBloc().jobEntity!.jobInterestStatus!=null?null:() {
                                 if(getBloc().jobEntity?.startDate == null){
                                   context.router.push(ApplyForJobRoute(job: getBloc().jobEntity!));
                                 }else{
                                   getBloc().add(ApplyForJobEvent());
                                 }
                                 },
                               child: Text(getBloc().jobEntity!.jobInterestStatus==null?getLocalization().apply:getLocalization().applied),
                             ),
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
                                        context.router.push(PaySomeoneWebViewRoute(bookingEntity: widget.bookingId , from: 2));
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
                             ):                         widget.fromIndex == 2?
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
                       ),
                     ListView(
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
                         if(getBloc().jobEntity!.images.isNotEmpty)
                         wText(getLocalization().photos, style: theme.textTheme.titleMedium),
                         20.height,
                         if(getBloc().jobEntity!.images.isNotEmpty)
                         ListView.builder(
                             shrinkWrap: true,
                             physics: const NeverScrollableScrollPhysics(),
                             itemCount: getBloc().jobEntity!.images.split(",").length??0,
                             itemBuilder: (context, index){
                               var images = getBloc().jobEntity!.images.split(",");
                               logger.e(images.length);
                               return
                                 images[index] == null &&
                                     images[index].isEmpty && index != 0 && !index.isOdd ?
                                 const SizedBox():
                                 Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(top: 16.0),
                                       child: Row(
                                         children: [
                                           if(index.isEven || index == 0)
                                             if(!images[0].isEmptyOrNull)
                                             Expanded(child: ImageThumbnail(
                                               imagePath:  images[index],
                                               //onRemove: ()=> getBloc().add(RemoveImageClickedEvent(index: index)),
                                             )),
                                           16.width, // Add some spacing between images
                                           if(images.length == index + 1)
                                             Expanded(child: Container(),),
                                           if(images.length > (index + 1) && index.isEven)
                                             Expanded(child: ImageThumbnail(
                                               imagePath:  images[index + 1],
                                               //onRemove: ()=>getBloc().add(RemoveImageClickedEvent(index: index + 1)),
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
                         if(getBloc().jobEntity != null && widget.pageMode==PageMode.hiring)PrimaryButton.fullWidth(onPressed: ()=>getBloc().add(
                             UpdateJobPublishedStatusEvent()
                         ),
                           child: wText((getBloc().jobEntity!.status=="active")? getLocalization().unpublishListing: getLocalization().publishListing),
                         ),
                         100.height,
                         widget.fromIndex == 0 && widget.pageMode!=PageMode.hiring  && ( getBloc().jobEntity!.jobInterestStatus==null)?
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
                         getBloc().jobEntity!.jobInterestStatus=="offered"?Padding(
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

                     if(widget.pageMode == PageMode.hiring)
                       Builder(
                         builder: (context) {
                           if(widget.pageMode != PageMode.hiring) {
                             return const SizedBox();
                           }
                           if (getBloc().jobEntity!.profiles == null || getBloc().jobEntity!.profiles!.isEmpty) {
                             return Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const SizedBox(
                                   height: 200,
                                   width: 200,
                                   child: Image(
                                     image: AssetImage(
                                         "assets/no_items_found.png"),
                                   ),
                                 ),
                                 24.height,
                                 Text(
                                   "No profiles found",
                                   style: theme.textTheme.headlineSmall,
                                   textAlign: TextAlign.center,
                                 )
                               ],
                             );
                           }
                           return ListView.builder(
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
                               });
                         }
                     ),
                     if(widget.pageMode == PageMode.hiring)
                       Builder(
                         builder: (context) {
                           if(widget.pageMode != PageMode.hiring) {
                             return const SizedBox();
                           }
                           if (getBloc().jobEntity!.matches == null || getBloc().jobEntity!.matches!.isEmpty) {
                             return Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const SizedBox(
                                   height: 200,
                                   width: 200,
                                   child: Image(
                                     image: AssetImage(
                                         "assets/no_items_found.png"),
                                   ),
                                 ),
                                 24.height,
                                 Text(
                                   "No profiles found",
                                   style: theme.textTheme.headlineSmall,
                                   textAlign: TextAlign.center,
                                 )
                               ],
                             );
                           }
                           return ListView.builder(
                               itemCount: getBloc().jobEntity!.matches?.length??0,
                               itemBuilder: (context, index){
                                 CandidateProfileEntity candidate = getBloc().jobEntity!.matches![index];
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
                                     context.router.push(CandidateProfileRoute(
                                         candidateProfile: candidate,
                                         job: getBloc().jobEntity,
                                         jobInterestId: getBloc().jobEntity!.matches![index].jobInterestId
                                     )).then((value) => getBloc().add(GetFullJobDetailsEvent(jobId: widget.jobId)));
                                   },
                                 );
                               });
                         }
                     ),
                   ], onTap: (int index) {  },
                 ),
                 ),
               ],
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
