
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:logger/logger.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/setup_profile/presentation/bloc/setup_profile_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class SetupProfilePage extends BasePage {
  const SetupProfilePage({super.key});


  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends BasePageState<SetupProfilePage, SetupProfileBloc> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBloc().add(SetUpProfileGetProfileEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<SetupProfileBloc, SetupProfilePageState>(
      listener: (context, state){
        //
        if(state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.success){
          Navigator.pop(context);
          context.router.push(const RegisterAccountStep1Route());
        }

        if(state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.loading){
          preloader(context);
        }

        if(state is SetupProfileSubmitProfileTypeState && state.dataState == DataState.error){

        }

        if(state is SetUpProfileToggleSelectedState && state.dataState == DataState.success){
          Logger logger = Logger();

          logger.d(getBloc().selectedToggleButtons);
        }
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 10.0, bottom: 10),
                child: Text(
                    getLocalization().welcomeLetsSetUpYourProfile(getBloc().profileModel!.firstName!),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
              Positioned(
                top: 140,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10.0, bottom: 10),
                  child: Text(
                      getLocalization().whatWouldYouLikeToDo,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )
                  ),
                ),
              ),
              Positioned(
                top: 190,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15,left: 15,top: 10.0, bottom: 10),
                  child: ProfileToggle(
                    onPressed: (int index) {
                      print("Clicked $index");
                      getBloc().add(SetUpProfileToggleSelectedEvent(selectedIndex: index));
                    },
                    selected: getBloc().selectedToggleButtons,
                    children: [
                      Container(width: (MediaQuery.of(context).size.width - 36)/2, child:  Center(child: Text(getLocalization().work))),
                      Container(width: (MediaQuery.of(context).size.width - 36)/2, child:  Center(child: Text(getLocalization().hire))),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 210,
                child: Container(
                  child: SvgPicture.asset("assets/landing_screen_lady.svg"),
                ),
              ),



              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 10, bottom: 10),
                  child: PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,onPressed: () async {
                
                    getBloc().add(SetupProfileSubmitProfileTypeEvent());
                  },
                      child: wText(getLocalization().getStarted)),
                ),
              ),

            ],
          ),
        );
      },
    );
  }


  @override
  SetupProfileBloc initBloc() {
    return locator<SetupProfileBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

}
