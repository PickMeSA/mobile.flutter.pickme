
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/profile_local_storage/profile/profile_model.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_decision_widget.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:iconsax/iconsax.dart';
import 'bloc/burger_menu_bloc.dart';

@RoutePage()
class BurgerMenuPage extends BasePage {
  const BurgerMenuPage({super.key});

  @override
  _BurgerMenuPageState createState() => _BurgerMenuPageState();
}

class _BurgerMenuPageState extends BasePageState<BurgerMenuPage, BurgerMenuBloc> {

  ProfileModel? profileModel;
  UserModel userModel = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = boxUser.get(current);
    profileModel = boxProfile.get(current);
  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<BurgerMenuBloc, BurgerMenuPageState>(
      listener: (context, state){

        if( state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.pushAndPopUntil( BottomNavigationBarRoute(initialIndex: 0),
              predicate: (Route<dynamic> route) => false);

        }

        if( state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.error){
          Navigator.pop(context);
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }

        if( state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.loading){
          preloader(context);

        }
      },
      builder: (context, state) {
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: SizedBox(
             height: MediaQuery.sizeOf(context).height,
             width: MediaQuery.sizeOf(context).width,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.8,
                      child: wText(getLocalization().hi(profileModel!.firstName!, profileModel!.surname!),
                          style: theme.textTheme.headlineMedium),
                    ),
                     const Spacer(),
                     InkWell(onTap: (){context.router.pop();},child: const Icon(Icons.close))
                   ],
                 ),

                 30.height,
                 wText(getLocalization().iWouldLikeTo),
                 15.height,

                 ProfileToggle(

                   onPressed: (int index) {

                     wDecisionWidget(theme: theme, leftButton:
                     ()=>Navigator.pop(context)
                     , rightButton: (){
                       getBloc().add(ToggleSelectedEvent(selectedIndex: index));
                       getBloc().add(SetupProfileSubmitProfileTypeEvent());
                       }
                         , leftButtonCaption: getLocalization().noCancel,
                         rightButtonCaption: getLocalization().yesSwitch,
                         message: index == 0 ?
                         getLocalization().switchingYourProfileFromHireToWorking:
                         getLocalization().switchingYourProfileFromWorkerToHire,
                         title: getLocalization().switchingProfiles,
                         context: context);
                   },
                   selected: userModel.type == 'work'?[true,false]: [false,true],
                   children: [
                     Container(width: (MediaQuery.of(context).size.width - 50)/2, child:  Center(child: Text(getLocalization().work))),
                     Container(width: (MediaQuery.of(context).size.width - 50)/2, child:  Center(child: Text(getLocalization().hire))),
                   ],
                 ),
                 30.height,
                 InkWell(
                   onTap: ()=> context.router.push(MyWalletRoute()),
                   child: ListTile(
                     leading: Icon(Iconsax.wallet_1),
                     title: wText(getLocalization().myWallet),
                     trailing: Icon(Icons.arrow_forward_ios),
                   ),
                 ),
                 AppDivider(),
                 ListTile(
                   leading: Icon(Iconsax.call),
                   title: wText(getLocalization().contactUs),
                   trailing: Icon(Icons.arrow_forward_ios),
                 ),
                 
                 Spacer(),

                 Row(
                   children: [
                     Expanded(
                       child: PrimaryButton(
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
                           context.router.pushAndPopUntil(LandingRoute(),
                           predicate: (Route<dynamic> route) => false);
        },
                         child: Text(getLocalization().logOut),
                       ),
                     ),
                   ],
                 )               ],
             ),
            ),
         );
      },
    );
  }


  @override
  BurgerMenuBloc initBloc() {
    return locator<BurgerMenuBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
