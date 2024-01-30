import 'dart:ui';

import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/domain/entities/review_entity.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:iconsax/iconsax.dart';

import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/contact_bloc.dart';

@RoutePage()
class ContactPage extends BasePage {
  const ContactPage({super.key, this.isHiring=false, this.userId}) : assert(isHiring==false || (isHiring==true && userId!=null));
  final bool isHiring;
  final String? userId;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends BasePageState<ContactPage, ContactPageBloc> {
  @override
  void initState() {
    super.initState();
  }
  _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget buildView(BuildContext context) {
    var theme = Theme.of(context);
    return BlocConsumer<ContactPageBloc, ContactPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getLocalization().needSupporWithPickme,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              24.height,
              InkWell(
                onTap: () async =>_launchUrl("tel://+27660033804"),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("0660033804")),
                      Icon(Iconsax.call)
                    ],
                  ),
                ),
              ),
              24.height,
              InkWell(
                onTap: () async =>_launchUrl("mailto:info@pick-me.co.za?subject=Pick-me%20support"),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("info@pick-me.co.za")),
                      Icon(Iconsax.sms)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  ContactPageBloc initBloc() {
    return locator<ContactPageBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().contactUs),
    );
  }


}