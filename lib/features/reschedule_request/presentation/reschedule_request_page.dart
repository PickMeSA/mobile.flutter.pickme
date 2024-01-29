
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/reschedule_request_bloc.dart';

@RoutePage()
class RescheduleRequestPage extends BasePage {

  final BookingEntity bookingEntity;
  const RescheduleRequestPage({super.key, required this.bookingEntity});

  @override
  _RescheduleRequestPageState createState() => _RescheduleRequestPageState();
}

class _RescheduleRequestPageState extends BasePageState<RescheduleRequestPage, RescheduleRequestBloc> {

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
    return BlocConsumer<RescheduleRequestBloc, RescheduleRequestPageState>(
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

    wText(getLocalization().rescheduleRequest,style:theme.textTheme.bodyMedium?.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 32,
    color: Colors.black
    )),
    20.height,
    wText(getLocalization().aRescheduleRequestHasBeenSentToYou),
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
    (Set<MaterialState> states){
    return
    Colors.white;
    }
    )
    ),
    onPressed: () {
    context.router.push( RescheduleRequestDetailsRoute(bookingEntity: widget.bookingEntity ));
    },
    child: Text(getLocalization().goToRescheduleRequest, style: TextStyle(color: theme.colorScheme.secondary),),
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
  RescheduleRequestBloc initBloc() {
    return locator<RescheduleRequestBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
