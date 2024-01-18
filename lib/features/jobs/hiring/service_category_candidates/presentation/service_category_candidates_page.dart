import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/jobs/hiring/service_category_candidates/presentation/bloc/service_category_candidates_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/filter_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/enums/app_mode_enum.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';

@RoutePage()
class ServiceCategoryCandidatesPage extends BasePage {
  const ServiceCategoryCandidatesPage({super.key, this.serviceCategoryId, });
  final String? serviceCategoryId;

  @override
  State<ServiceCategoryCandidatesPage> createState() => _ServiceCategoryCandidatesPage();
}

class _ServiceCategoryCandidatesPage extends BasePageState<ServiceCategoryCandidatesPage, ServiceCategoryCandidatesBloc> {

  @override
  void initState() {
    super.initState();
    getBloc().add(ServiceCategoryCandidatesPageEnteredEvent(serviceCategoryId: widget.serviceCategoryId));
  }

  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<ServiceCategoryCandidatesBloc, ServiceCategoryCandidatesState>(
      listener: (context, state) {
        if(state is GetServiceCategoryCandidatesState && state.dataState == DataState.success){
          Navigator.pop(context);
        }

        //error
        if(state is GetServiceCategoryCandidatesState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: "failed to get candidates", type: getLocalization().error, context: context);
        }
        //loading
        if(state is GetServiceCategoryCandidatesState && state.dataState == DataState.loading){
          if(!getBloc().preloaderActive){
            getBloc().preloaderActive = true;
            preloader(context);
          }
        }
      },
      builder: (context, state) {
        PaginatedCandidateProfileEntity? paginatedCandidates = state.paginatedCandidates;
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: ListView(
            children: <Widget>[
              (paginatedCandidates!=null && paginatedCandidates.candidates.isEmpty)? ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: paginatedCandidates.candidates.length,
                itemBuilder: (BuildContext context, int index){
                  CandidateProfileEntity candidate = paginatedCandidates.candidates[index];
                  return AppCandidateProfile(
                    fullName: candidate.fullName,
                    jobTitle: candidate.jobTitle?? getLocalization().noJobDescription,
                    rating: candidate.rating??0,
                    hourlyRate: "R${candidate.hourlyRate}p/h",
                    image: (candidate.profilePicture!=null)?
                    CachedNetworkImageProvider(
                        candidate.profilePicture!
                    ):null,
                    viewProfileFunction: (){
                      context.router.push(CandidateProfileRoute(candidateProfile: candidate));
                    },
                  );
                  },
                ):Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                    width: 200,
                    child: Image(
                      image: AssetImage("assets/no_items_found.png"),
                    ),
                  ),
                  24.height,
                  Text(getLocalization().noProfilesAvailableForThisCategory,
                    style: theme.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              if(paginatedCandidates!=null && paginatedCandidates.pagination.nextPage!=null)SecondaryButtonDark(onPressed: ()=> getBloc().add(
                  LoadMoreClickedEvent(
                      paginationEntity: paginatedCandidates!.pagination,
                    serviceCategoryId: widget.serviceCategoryId
                  )
              ), child: Text(getLocalization().loadMore))
            ],
          ),
        );
      },
    );
  }

  @override
  ServiceCategoryCandidatesBloc initBloc() {
    return locator<ServiceCategoryCandidatesBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().serviceCategory,),
      actions: [
        TextButton(onPressed: () async{
          FilterEntity? filter = await context.router.push<FilterEntity>(FiltersRoute(appMode: AppMode.hiring));
          if(filter!=null){
            getBloc().add(FilterChangedEvent(filterEntity: filter));
          }
          }, child: Icon(Iconsax.candle_2, color: Theme.of(context).colorScheme.secondary,))
      ],
    );
  }

}