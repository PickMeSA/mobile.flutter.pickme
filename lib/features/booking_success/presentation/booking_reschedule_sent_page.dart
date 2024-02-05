
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/booking_reschedule_sent_bloc.dart';

@RoutePage()
class BookingSuccessPage extends BasePage {
  const BookingSuccessPage({super.key});

  @override
  _BookingSuccessPageState createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends BasePageState<BookingSuccessPage, BookingRescheduleSentBloc> {

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
    return BlocConsumer<BookingRescheduleSentBloc, BookingRescheduleSentPageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return SizedBox(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child:SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   wText(getLocalization().youFoundSomeoneForTheJob,style:theme.textTheme.bodyMedium?.copyWith(
                       fontWeight: FontWeight.w600,
                       fontSize: 32,
                       color: Colors.black
                   )),
                   20.height,
                   wText(getLocalization().keepTabsOnThisJobInMyBookings),
                   20.height,
                   SizedBox(
                     height: 400,
                     child: Stack(
                       children: [
                         Positioned(left: 50,child: SvgPicture.asset('assets/green_background.svg')),
                         Positioned(bottom: 30,child: SvgPicture.asset('assets/white_chair.svg')),
                         Positioned(bottom: -70, left: 50,child: SvgPicture.asset('assets/lady_on_chair_with_tablet.svg')),
                       ],
                     )
                   ),
                   40.height,
                   Row(
                     children: [
                       Expanded(
                         child: PrimaryButton.fullWidth(
                           onPressed: ()=>context.router.replace(BottomNavigationBarRoute(initialIndex: 1)),
                           child: Text(getLocalization().backToBooking, style: TextStyle(color: theme.colorScheme.secondary),),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           )  ,
         );
      },
    );
  }


  @override
  BookingRescheduleSentBloc initBloc() {
    return locator<BookingRescheduleSentBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
