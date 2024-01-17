
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bloc/pay_someone_web_view_bloc.dart';

@RoutePage()
class PaySomeoneWebViewPage extends BasePage {
  const PaySomeoneWebViewPage({super.key});

  @override
  _PaySomeoneWebViewPageState createState() => _PaySomeoneWebViewPageState();
}

class _PaySomeoneWebViewPageState extends BasePageState<PaySomeoneWebViewPage, PaySomeoneWebViewBloc> {
  final WebViewController webViewController = WebViewController();
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
    return BlocConsumer<PaySomeoneWebViewBloc, PaySomeoneWebViewPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return WebViewWidget(controller: webViewController);
      },
    );
  }


  @override
  PaySomeoneWebViewBloc initBloc() {
    return locator<PaySomeoneWebViewBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
