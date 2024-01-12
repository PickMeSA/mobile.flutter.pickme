
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:pickme/utils/date_formaters.dart';

import 'bloc/reschedule_request_details_bloc.dart';

@RoutePage()
class RescheduleRequestDetailsPage extends BasePage {

  final String bookingId;
  const RescheduleRequestDetailsPage({super.key, required this.bookingId});

  @override
  _RescheduleRequestDetailsPageState createState() => _RescheduleRequestDetailsPageState();
}

class _RescheduleRequestDetailsPageState extends BasePageState<RescheduleRequestDetailsPage, RescheduleRequestDetailsBloc> {

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
    return BlocConsumer<RescheduleRequestDetailsBloc, RescheduleRequestDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
        ThemeData theme = Theme.of(context);
         return Container(
           height: MediaQuery.sizeOf(context).height,
           width: MediaQuery.sizeOf(context).width,
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [

                       InkWell(onTap: ()=> context.router.pop()
                       ,child: Icon(Icons.arrow_back_rounded)),
                       20.width,
                       wText(getLocalization().rescheduleRequest, style: theme.textTheme.titleLarge),
                     ],
                   ),
                   30.height,
                   wText(getLocalization().needsToRescheduleThisBooking("Freedom")),
                   50.height,
                   wText(getLocalization().proposedDateAndTime,
                   style: theme.textTheme.titleMedium),
                   40.height,
                   Container(
                     height: 60,
                     color: Colors.grey.shade100,
                     child: Padding(padding: EdgeInsets.all(20),
                     child: Row(
                       children: [
                         wText(DateFormatters.getDayMonthYear(DateTime.now()), style: theme.textTheme.titleLarge),
                         Spacer(),
                         wText(DateFormatters.getHMTime(DateTime.now()), style: theme.textTheme.titleLarge),
                       ],
                     ),),
                   ),
                   40.height,
                   const AppDivider(),
                   30.height,
                   wText(getLocalization().otherComments,style: theme.textTheme.titleMedium),
                   20.height,
                   wText(getLocalization().exampleText),
                   20.height,
                   const AppDivider(),
                   30.height,
                   wText(getLocalization().proposeAnotherTime,style: theme.textTheme.titleMedium),
                   20.height,
                   wText(getLocalization().notSatisfiedWithTheProposedRescheduleDateAndTime),
                   20.height,
                   InkWell(
                     onTap: ()=> context.router.push(ProposeAlternativeRoute(bookingId: widget.bookingId)),
                     child: Row(
                       children: [
                         wText(getLocalization().proposeAlternative, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                         10.width,
                         Icon(Icons.arrow_forward_rounded)

                       ],
                     ),
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
  RescheduleRequestDetailsBloc initBloc() {
    return locator<RescheduleRequestDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
