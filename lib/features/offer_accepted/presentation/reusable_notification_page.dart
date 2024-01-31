
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

import 'bloc/application_sent_bloc.dart';

@RoutePage()
class ReusableNotificationPage extends BasePage {
  const ReusableNotificationPage({super.key,required this.title, required this.message, required this.button, required this.image, });
  final String title;
  final String message;
  final Widget button;
  final Image image;
  @override
  _ReusableNotificationPageState createState() => _ReusableNotificationPageState();
}

class _ReusableNotificationPageState extends BasePageState<ReusableNotificationPage, ReusableNotificationPageBloc> {

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
    return BlocConsumer<ReusableNotificationPageBloc, OfferAcceptedPageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                wText(widget.title,style:theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.black
                )),
                20.height,
                wText(widget.message),
                20.height,
                SizedBox(
                  height: 400,
                  child: widget.image,
                ),
                Spacer(),
                widget.button
              ],
            ),
          )  ,
        );
      },
    );
  }


  @override
  ReusableNotificationPageBloc initBloc() {
    return locator<ReusableNotificationPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
