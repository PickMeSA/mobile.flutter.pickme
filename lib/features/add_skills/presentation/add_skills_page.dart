
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/add_skills/domain/entities/preferred_industry.dart';
import 'package:pickme/features/add_skills/domain/entities/skill.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/w_colors.dart';
import 'package:pickme/shared/widgets/w_qualification_slab.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/add_skills_bloc.dart';

@RoutePage()
class AddSkillsPage extends BasePage {
  const AddSkillsPage({super.key});

  @override
  _AddSkillsPageState createState() => _AddSkillsPageState();
}
class _AddSkillsPageState extends BasePageState<AddSkillsPage, AddSkillsBloc> {
  
  late TextEditingController dropdownIndustryController = TextEditingController();
  late TextEditingController dropDownSkillController = TextEditingController();
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
    var theme = Theme.of(context);
    return BlocConsumer<AddSkillsBloc, AddSkillsPageState>(
      listener: (context, state){},
      builder: (context, state) {

         return SizedBox(
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
                       wText(getLocalization().skip,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600))
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

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 60),
                    child: AppDropdownMenu<PreferredIndustry>(
                      onSelected: (selected){
                        getBloc().add(PreferredIndustrySelectedEvent(preferredIndustry: selected!));
                      },
                        width: MediaQuery.sizeOf(context).width - 40,
                        enableFilter: true,
                        dropdownMenuEntries: getBloc().industryEntries,
                        controller: dropdownIndustryController,
                    label: wText(getLocalization().preferredIndustry, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.grey))),
                  ),
                   wText(getLocalization().skillsMax5,style: theme.textTheme.bodyMedium?.copyWith(
                       fontSize: 16,
                   fontWeight: FontWeight.w600)),
                   Padding(
                     padding: const EdgeInsets.only(top: 10, bottom: 30),
                     child: AppDropdownMenu<Skill>(
                        onSelected: (selected){
                          getBloc().add(SkillSelectedEvent(skill: selected!));
                        },
                         width: MediaQuery.sizeOf(context).width - 40,
                         enableFilter: true,
                         dropdownMenuEntries: getBloc().skillEntries,
                         controller: dropDownSkillController,
                         label: wText(getLocalization().skillsA, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 16,color: Colors.grey))),
                   ),

                   SizedBox(
                     height: 250 ,
                     child: Center(
                       child: ChipGroup(
                         inputs: getBloc().chipOptions,
                         onDeleted: (){
                           getBloc().add(SkillChipDeletedEvent(index: 0));
                         }, onSelected: (bool value) {

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
                             context.router.push(const RateAndWorkTimesRoute());
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
         );
      },
    );
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