
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
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_pay_someone.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/pay_someone_bloc.dart';

@RoutePage()
class PaySomeonePage extends BasePage {
  const PaySomeonePage({super.key});

  @override
  _PaySomeonePageState createState() => _PaySomeonePageState();
}

class _PaySomeonePageState extends BasePageState<PaySomeonePage, PaySomeoneBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(LoadBookingsUpcomingEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PaySomeoneBloc, PaySomeonePageState>(
      listener: (context, state){


        if(state is LoadBookingUpcomingState &&  state.dataState == DataState.error){
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }




      },
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
        return state.dataState == DataState.init?
        const Center(
          child: CircularProgressIndicator(),)
            : state.dataState == DataState.loading && state is LoadBookingUpcomingState ? const Center(
          child: CircularProgressIndicator(),):
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      wText(getLocalization().paySomeone,
                          style: theme.textTheme.headlineMedium),
                      const Spacer(),
                      InkWell(onTap: (){context.router.pop();},child: const Icon(Icons.close))
                    ],
                  ),
                  30.height,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getBloc().upcomingHireBookingsList.length,
                      itemBuilder: (context, int index){
                      return wPaySomeone(
                          bookingEntity: getBloc().upcomingHireBookingsList[index],
                          currency: getLocalization().r,
                        buttonCation: getLocalization().payNow,
                        theme: theme,
                        onTap: ()async {
                          await context.router.push(
                              PaySomeoneWebViewRoute(bookingEntity: getBloc()
                                  .upcomingHireBookingsList[index],
                                  from: 1));
                          getBloc().add(LoadBookingsUpcomingEvent());
                        }
                      );


                  })

                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  PaySomeoneBloc initBloc() {
    return locator<PaySomeoneBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
