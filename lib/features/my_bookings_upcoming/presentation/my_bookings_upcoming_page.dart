
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'bloc/my_bookings_upcoming_bloc.dart';

@RoutePage()
class MyBookingsUpcomingPage extends BasePage {
  const MyBookingsUpcomingPage({super.key});

  @override
  _MyBookingsUpcomingPageState createState() => _MyBookingsUpcomingPageState();
}

class _MyBookingsUpcomingPageState extends BasePageState<MyBookingsUpcomingPage, MyBookingsUpcomingBloc> {

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

    ThemeData theme = Theme.of(context);
    return BlocConsumer<MyBookingsUpcomingBloc, MyBookingsUpcomingPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Row(
                   children: [
                     Icon(Iconsax.calendar_2),
                     10.width,
                     wText(getLocalization().myBookings, style: theme.textTheme.headlineSmall?.copyWith()),
                     Spacer(),
                     InkWell(
                       child: Icon(Iconsax.menu),
                     ),

                   ],
                 ),
                 30.height,

               ],
             ),
           ),
         );
      },
    );
  }


  @override
  MyBookingsUpcomingBloc initBloc() {
    return locator<MyBookingsUpcomingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
