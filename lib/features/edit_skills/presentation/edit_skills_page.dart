
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/add_skills/domain/entities/skill_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/edit_skills_bloc.dart';

@RoutePage()
class EditSkillsPage extends BasePage {
  final ProfileEntity profileEntity;
  const EditSkillsPage({required this.profileEntity,super.key});

  @override
  _EditSkillsPageState createState() => _EditSkillsPageState();
}

class _EditSkillsPageState extends BasePageState<EditSkillsPage, EditSkillsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBloc().add(EditSkillsGetSkillsListEvent(profileEntity: widget.profileEntity));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<EditSkillsBloc, EditSkillsPageState>(
      listener: (context, state){
        if(state is SubmitRemoteSkillsListState && state.dataState == DataState.loading){
          preloader(context);
        }

        if(state is SubmitRemoteSkillsListState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state is SubmitRemoteSkillsListState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.pop(state.profileEntity);
        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return state.dataState == DataState. loading?
         const Center(
           child: CircularProgressIndicator(),
         ):SizedBox(
           width: MediaQuery.sizeOf(context).width,
           height: MediaQuery.sizeOf(context).height,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Row(
                   children: [
                     InkWell(onTap: ()=> context.router.pop()
                         ,child: const Icon(Icons.arrow_back_rounded)),
                     20.width,
                     wText(getLocalization().editSkills, style: theme.textTheme.titleLarge),
                   ],
                 ),
                 20.height,
                 Padding(
                   padding: const EdgeInsets.only(top: 10, bottom: 30),
                   child: MultiAppDropdownMenu<SkillEntity>(
                       onSelected: (selected){
                         getBloc().add(SkillSelectedEvent(skill: selected!));
                       },
                       width: MediaQuery.sizeOf(context).width - 40,
                       enableFilter: false,
                       filled: true,
                       dropdownMenuEntries: getBloc().skillEntries,
                       label: wText(getLocalization().skillsA,
                           style: theme.textTheme.bodyMedium?.copyWith(
                               fontWeight: FontWeight.w400,
                               fontSize: 16,
                               color: Colors.grey))),
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
                 const Spacer(),
                 Row(
                   children: [
                     Expanded(
                       child: PrimaryButton(
                         style: ButtonStyle(
                             side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                               return BorderSide(
                                 color:
                                 theme.colorScheme.secondary,
                                 width: 2,
                               );
                             }
                             ),
                             backgroundColor: MaterialStateProperty.resolveWith(
                                     (Set<MaterialState> states) {
                                   return Colors.white;
                                 }
                             )
                         ),
                         onPressed: getBloc().checked?null:() {
                           context.router.pop();
                         },
                         child: Text(getLocalization().cancel,style: TextStyle(color: Colors.black)),
                       ),
                     ),
                     10.width,
                     Expanded(
                       child: PrimaryButton(
                         style: ButtonStyle(
                             side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                               return BorderSide(
                                 color: states.contains(MaterialState.disabled)?
                                 theme.colorScheme.primary.withOpacity(0):
                                 theme.colorScheme.primary,
                                 width: 2,
                               );
                             }
                             ),
                             backgroundColor: MaterialStateProperty.resolveWith(
                                     (Set<MaterialState> states){
                                   return states.contains(MaterialState.disabled)?
                                   theme.colorScheme.primary.withOpacity(0.3):
                                   theme.colorScheme.primary;
                                 }
                             )
                         ),
                         onPressed: () {
                          getBloc().add(SubmitRemoteSkillsListEvent(profileEntity: widget.profileEntity));
                         },
                         child: Text(getLocalization().save),
                       ),
                     ),
                   ],
                 )
               ],
             ),
           ),
          );
      },
    );
  }


  @override
  EditSkillsBloc initBloc() {
    return locator<EditSkillsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
