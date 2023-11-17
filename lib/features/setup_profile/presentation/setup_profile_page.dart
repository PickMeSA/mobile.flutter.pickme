
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/register/domain/entities/user/user_model.dart';
import 'package:pickme/features/setup_profile/presentation/bloc/setup_profile_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';

@RoutePage()
class SetupProfilePage extends BasePage {
  const SetupProfilePage({super.key, required this.userModel});
  final UserModel userModel;

  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends BasePageState<SetupProfilePage, SetupProfileBloc> {
  List<bool> selectedToggleButtons = [true,false];

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
      listener: (context, state){},
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 10.0, bottom: 10),
                child: Text(
                    getLocalization().welcomeLetsSetUpYourProfile(state.profileModel!.firstName!),
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
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < selectedToggleButtons.length; i++) {
                          selectedToggleButtons[i] = i == index;
                        }
                      });
                    },
                    selected: selectedToggleButtons,
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
                  child: PrimaryButton(width: MediaQuery.sizeOf(context).width - 45,
                      onPressed: () async {
                    context.router.push(const QualificationsRoute());
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
