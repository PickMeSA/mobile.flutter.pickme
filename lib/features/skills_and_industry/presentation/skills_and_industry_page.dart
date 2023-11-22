
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/heading_button.dart';
import 'package:pickme/shared/widgets/w_qualification_slab.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/skills_and_industry_bloc.dart';

@RoutePage()
class SkillsAndIndustryPage extends BasePage {
  const SkillsAndIndustryPage({super.key});

  @override
  _SkillsAndIndustryPageState createState() => _SkillsAndIndustryPageState();
}

class _SkillsAndIndustryPageState extends BasePageState<SkillsAndIndustryPage, SkillsAndIndustryBloc> {

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
    return BlocConsumer<SkillsAndIndustryBloc, SkillsAndIndustryPageState>(
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
                       Spacer(),
                       InkWell(onTap: ()=> context.router.push(const RateAndWorkTimesRoute()),child: wText(getLocalization().skip,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)))
                     ],
                   ),
                   wText(getLocalization().step3,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                   const SizedBox(height: 10,),
                   wText(getLocalization().skillsAndIndustry,style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                   Padding(
                       padding: const EdgeInsets.only(top: 20),
                       child: AppDropdownMenu<String>(

                         label: wText(getLocalization().preferredIndustry),
                         enableFilter: true,
                         dropdownMenuEntries: state.entries??[],
                         width: MediaQuery.of(context).size.width-40,),

                   ),

                   SizedBox(height: 70,),
                   wText(getLocalization().skillsMax5, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                   Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: headingButton(
                           icon: const Icon(Icons.work_outline_rounded,
                             size: 24,),
                           buttonCaption: getLocalization().addASkill,
                           onClick: (){
                            // context.router.push(AddWorkExperienceRoute());
                           }
                       )
                   ),
                   SizedBox(height: 20,),
                   ChipGroup(
                     inputs: [
                       ChipOption(label: "Skill 1", id: 1),
                       ChipOption(label: "Skill 2", id: 2),
                       ChipOption(label: "Skill 3", id: 3),
                       ChipOption(label: "Skill 4", id: 4),
                     ],
                     onDeleted: (){}, onSelected: (bool value) {  },
                   ),

                    SizedBox(height:MediaQuery.sizeOf(context).height * 0.7/3 ,),
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
                       PrimaryButton(onPressed: (){
                         //context.router.push(SkillsAndIndustryRoute());
                       },
                         fullWidth:  false,
                         width: MediaQuery.sizeOf(context).width * 3.6/5,
                         child: wText(getLocalization().nextStep),)
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
  SkillsAndIndustryBloc initBloc() {
    return locator<SkillsAndIndustryBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
