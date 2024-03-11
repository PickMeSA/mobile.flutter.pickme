
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry_entity.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_page_loader.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/add_skills_bloc.dart';

@RoutePage()
class AddSkillsPage extends BasePage {
  ProfileEntity profileEntity;
   AddSkillsPage({required this.profileEntity,super.key});

  @override
  _AddSkillsPageState createState() => _AddSkillsPageState();
}
class _AddSkillsPageState extends BasePageState<AddSkillsPage, AddSkillsBloc> {
  
  late TextEditingController dropdownIndustryController = TextEditingController();
  late TextEditingController dropDownSkillController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getBloc().add(AddSkillsGetPreferredIndustryListEvent());
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<AddSkillsBloc, AddSkillsPageState>(
      listener: (context, state){
        //AddSkillsGetPreferredIndustryListState//////
        //////////////////////////////////////////////
        if(state is AddSkillsGetPreferredIndustryListState && state.dataState == DataState.success){
          getBloc().add(AddSkillGetSkillsListEvent());
        }

        if(state is AddSkillsGetPreferredIndustryListState && state.dataState == DataState.loading){

        }

        if(state is AddSkillsGetPreferredIndustryListState && state.dataState == DataState.error){

        }

        //AddSkillGetSkillsListState//////
        //////////////////////////////////////////////
        if(state is AddSkillGetSkillsListState && state.dataState == DataState.success){

        }

        if(state is AddSkillGetSkillsListState && state.dataState == DataState.loading){

        }

        if(state is AddSkillGetSkillsListState && state.dataState == DataState.error){

        }

        //AddSkillSubmitRemoteSkillsAndIndustryState//////
        //////////////////////////////////////////////
        if(state is AddSkillSubmitRemoteSkillsAndIndustryState && state.dataState == DataState.success){
          Navigator.pop(context);
          getBloc().preloaderActive = false;
        _routePage(profileEntity: state.profileEntity!, context: context);
        }

        if(state is AddSkillSubmitRemoteSkillsAndIndustryState && state.dataState == DataState.loading){
          preloader(context);
          getBloc().preloaderActive = true;
        }

        if(state is AddSkillSubmitRemoteSkillsAndIndustryState && state.dataState == DataState.error){

        }
      },
      builder: (context, state) {
         return state.dataState == DataState.success && state is AddSkillGetSkillsListState
             || state.dataState == DataState.success && state is SkillSelectedState
             || state.dataState == DataState.success && state is SkillChipDeletedState?
           SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child:SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       const Spacer(),
                       InkWell(
                           onTap: ()=> _routePage(profileEntity: widget.profileEntity, context: context),
                           child: wText(getLocalization().skip,
                               style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)))
                     ],
                   ),
                   wText(
                     getLocalization().step3,
                     style: theme.textTheme.headlineLarge!.copyWith(
                       color: theme.primaryColor,
                     ),
                   ),
                   const SizedBox(height: 10,),
                   wText(getLocalization().skillsAndIndustry,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 20,),
                   wText(getLocalization().industry,style: theme.textTheme.bodyMedium?.copyWith(
                       fontSize: 16,
                       fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 60),
                    child: DropdownSearch<PreferredIndustryEntity>(
                      onChanged: (selected){
                        getBloc().add(PreferredIndustrySelectedEvent(preferredIndustry: selected!));
                      },

                        items: getBloc().preferredIndustryListEntity!.preferredIndustryListEntity!
                            .map((PreferredIndustryEntity industry) {
                              logger.d(industry.industry);
                              return industry;
                            }).toList(),
                        selectedItem: getBloc().selectedIndustry,

                  ),),

                   wText(getLocalization().skillsMax5,style: theme.textTheme.bodyMedium?.copyWith(
                       fontSize: 16,
                   fontWeight: FontWeight.w600)),

                   Padding(
                     padding: const EdgeInsets.only(top: 10, bottom: 30),
                     child:AppMultiSelectDropdownMenu<SkillEntity>(
                         leadingIcon: const Icon(Iconsax.add),
                         onSearch: (selected){
                           // getBloc().add(SkillSelectedEvent(skill: selected!));
                         },
                         onChanged: (selected){
                           getBloc().add(SkillSelectedEvent(skill: selected!));
                         },
                         width: MediaQuery.sizeOf(context).width - 70,
                         enableFilter: true,
                         dropdownMenuEntries: getBloc().skillEntries,
                         label: wText(getLocalization().skillsA,
                             style: theme.textTheme.bodyMedium?.copyWith(
                                 fontWeight: FontWeight.w400,
                                 fontSize: 16,
                                 color: Colors.grey)
                         )
                     ),
                   ),

                   SizedBox(
                     height: 250 ,
                     child: Center(
                       child: ChipGroup(
                         inputs: getBloc().chipOptions,
                         onDeleted: (int index){
                           getBloc().add(SkillChipDeletedEvent(index: 0));
                         },
                       ),
                     ),
                   ),

                   const SizedBox(height: 50,),
                   Row(
                     children: [
                       Container(
                         height: 56,
                         width: 56,
                         decoration: BoxDecoration(
                             border: Border.all(width: 2,
                                 color: Colors.black),
                             borderRadius: const BorderRadius.all(Radius.circular(10))),
                         child: InkWell(onTap: ()=> context.router.pop(),child: const Icon(Icons.arrow_back)) ,

                       ),
                       const SizedBox(width: 10,),
                       Expanded(
                         child: PrimaryButton(
                           style: ButtonStyle(
                               side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                 return BorderSide(
                                   color: states.contains(MaterialState.disabled)?
                                   theme.colorScheme.secondary.withOpacity(0):
                                   theme.colorScheme.secondary,
                                   width: 2,
                                 );
                               }
                               ),
                               backgroundColor: MaterialStateProperty.resolveWith(
                                       (Set<MaterialState> states){
                                     return states.contains(MaterialState.disabled)?
                                     theme.colorScheme.secondary.withOpacity(0.3):
                                     theme.colorScheme.secondary;
                                   }
                               )
                           ),
                           onPressed: !getBloc().checked?null:() {
                             getBloc().add(AddSkillSubmitRemoteSkillsAndIndustryEvent());
                           },
                           child: Text(getLocalization().nextStep),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
           )  ,
         ):
          state.dataState == DataState.loading && state is AddSkillsGetPreferredIndustryListState ?
          pageLoader():
         Container();
      },
    );
  }

  _routePage({required BuildContext context,required ProfileEntity profileEntity }){
    if(profileEntity!.hourlyRate! == 0){
      context.router.push(const RateAndWorkTimesRoute());
    }else if(profileEntity!.paymentDetails!.bankName!.isEmpty){
      context.router.push(const BankDetailsRoute());
    }else if(profileEntity!.location!.address == "" ){
      context.router.push(const LocationRoute());
    }else if(profileEntity!.description!.isEmpty){
      context.router.push(const FinalDetailsRoute());
    }else if(!profileEntity!.subscriptionPaid!) {
      context.router.push( PaySomeoneWebViewRoute(from: 0));
    }else{
      context.router.pushAndPopUntil( BottomNavigationBarRoute(), predicate: (Route<dynamic> route) => false);
    }
  }


  @override
  AddSkillsBloc initBloc() {
    return locator<AddSkillsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
