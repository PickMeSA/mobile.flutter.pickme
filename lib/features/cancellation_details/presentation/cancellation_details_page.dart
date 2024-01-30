
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import 'bloc/cancellation_details_bloc.dart';

@RoutePage()
class CancellationDetailsPage extends BasePage {
  BookingEntity bookingEntity;
   CancellationDetailsPage({required this.bookingEntity, super.key});

  @override
  _CancellationDetailsPageState createState() => _CancellationDetailsPageState();
}

class _CancellationDetailsPageState extends BasePageState<CancellationDetailsPage, CancellationDetailsBloc> {
  String? name;
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
    return BlocConsumer<CancellationDetailsBloc, CancellationDetailsPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          ThemeData theme = Theme.of(context);

          if (widget.bookingEntity.proposerUid ==
              widget.bookingEntity.labourerUid) {
            name = "Laborer";
          } else {
            name = widget.bookingEntity.customer?.firstName ?? "";
          }

          return SizedBox(
            height: MediaQuery
                .sizeOf(context)
                .height,
            width: MediaQuery
                .sizeOf(context)
                .width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        InkWell(onTap: () => context.router.pop()
                            , child: Icon(Icons.arrow_back_rounded)),
                        20.width,
                        wText(getLocalization().cancellationDetails,
                            style: theme.textTheme.titleLarge),
                      ],
                    ),
                    30.height,
                    wText(getLocalization().cancelledThisBooking(name!)),
                    50.height,
                    wText(getLocalization().reasonForCancellation,
                        style: theme.textTheme.titleMedium),
                    40.height,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            color: Colors.grey.shade100,
                            child: Padding(padding: EdgeInsets.all(20),
                                child: wText(widget.bookingEntity.reasonForChange!,
                                    style: theme.textTheme.titleLarge)),
                          ),
                        ),
                      ],
                    ),
                    40.height,
                    const AppDivider(),
                    30.height,
                    wText(getLocalization().otherComments,
                        style: theme.textTheme.titleMedium),

                    20.height,
                    wText(widget.bookingEntity.comments),
                    20.height,
                    50.height,

                  ],
                ),
              ),
            ),
          );
        }
    );
  }


  @override
  CancellationDetailsBloc initBloc() {
    return locator<CancellationDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
