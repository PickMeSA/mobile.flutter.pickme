import 'package:flutter/services.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_page_padding.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/request_a_review_bloc.dart';

@RoutePage()
class RequestAReviewPage extends BasePage {
  const RequestAReviewPage({super.key});

  @override
  State<RequestAReviewPage> createState() => RequestAReviewPageState();
}

class RequestAReviewPageState extends BasePageState<RequestAReviewPage, RequestAReviewBloc> {

  @override
  void initState() {
    super.initState();
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
  @override
  Widget buildView(BuildContext context) {
    UserModel userModel = boxUser.get(current);
    return BlocConsumer<RequestAReviewBloc, RequestAReviewState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          padding: wPagePadding(top:0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state.dataState == DataState.loading) const Center(
                  child: Text("Loading..."),
                ),
                Text(getLocalization().allowYourClientsToLeaveAReview),
                48.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: 'pickMeApp://reviews/${userModel.id}',
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    24.height,
                    GestureDetector(onTap: (){
                      Clipboard.setData(ClipboardData(text: "https://www.pick-me.co.za/reviews/${userModel.id}"))
                          .then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied!"))));
                      logger.d("https://www.pick-me.co.za/reviews/${userModel.id}");
                      _launchUrl("https://www.pick-me.co.za/reviews/${userModel.id}");
                    }, child: Text(
                        'https://www.pick-me.co.za/reviews/${userModel.id}'
                    )),
                    24.height,
                    SecondaryButtonDark(onPressed: (){
                      Clipboard.setData(ClipboardData(text: "https://www.pick-me.co.za/reviews/${userModel.id}"))
                          .then((value) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied!"))));
                    }, child: Text(getLocalization().copyLink)),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  RequestAReviewBloc initBloc() {
    return locator<RequestAReviewBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().requestAReview,),
    );
  }

}