
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/edit_about_me_bloc.dart';

@RoutePage()
class EditAboutMePage extends BasePage {
   EditAboutMePage({required this.profileEntity, super.key});
   ProfileEntity profileEntity;
  @override
  _EditAboutMePageState createState() => _EditAboutMePageState();
}

class _EditAboutMePageState extends BasePageState<EditAboutMePage, EditAboutMeBloc> {
  TextEditingController aboutYouController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutYouController.text = widget.profileEntity.description??"";
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<EditAboutMeBloc, EditAboutMePageState>(
      listener: (context, state){
        if(state is SubmitClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          widget.profileEntity = state.profileEntity!;
          context.router.pop();
        }

        if(state is SubmitClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if(state is SubmitClickedState && state.dataState == DataState.loading){
          preloader(context);

        }
      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Form(
               key: _formKey,
               child: Column(
                 children: [
                   Row(
                     children: [

                       InkWell(onTap: ()=> context.router.pop()
                           ,child: const Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().editAboutMe, style: theme.textTheme.titleLarge),
                     ],
                   ),
                   50.height,
                   AppTextFormField(
                       controller: aboutYouController,
                       keyboardType: TextInputType.multiline,
                       labelText: getLocalization().aboutYouBasedOnYourProfile,
                       textFieldType: TextFieldType.MULTILINE,
                       maxLines: 10,maxLength: 2000,
                   validator: null),
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
                           onPressed: getBloc().checked?null:() {
                              if(_formKey.currentState!.validate()){
                                getBloc().add(SubmitClickedEvent(description: aboutYouController.text));
                              }
                           },
                           child: Text(getLocalization().save),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
           ),
          );
      },
    );
  }


  @override
  EditAboutMeBloc initBloc() {
    return locator<EditAboutMeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
