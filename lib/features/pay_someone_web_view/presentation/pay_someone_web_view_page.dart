
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/login/domain/entities/token/token_model.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bloc/pay_someone_web_view_bloc.dart';

@RoutePage()
class PaySomeoneWebViewPage extends BasePage {
  int? from = 0;
  ProfileEntity? profileEntity;
  BookingEntity? bookingEntity;
   PaySomeoneWebViewPage({ required this.from ,this.bookingEntity,this.profileEntity, super.key});

  @override
  _PaySomeoneWebViewPageState createState() => _PaySomeoneWebViewPageState();
}

class _PaySomeoneWebViewPageState extends BasePageState<PaySomeoneWebViewPage, PaySomeoneWebViewBloc> {
   WebViewController webViewController = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(MakePaymentEvent(bookingEntity: widget.bookingEntity));

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PaySomeoneWebViewBloc, PaySomeoneWebViewPageState>(
      listener: (context, state){
        TokenModel tokenModel = boxTokens.get(current);
        if(state is MakePaymentState && state.dataState == DataState.success){
          webViewController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..addJavaScriptChannel("Payment",
                onMessageReceived: (message){
                  if(message.message == "success"){
                    context.router.push(PaymentOutcomeRoute(from: widget.from!, paymentSuccess: true));
                  }else if(message.message == "failed"){
                    context.router.push(PaymentOutcomeRoute(from: widget.from!, paymentSuccess: false));
                  }else{
                    context.router.pop();
                    wErrorPopUp(message: message.message, type: getLocalization().error, context: context);
                  }
                })
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {

                  context.router.pop();
                  wErrorPopUp(message: error.description, type: getLocalization().error, context: context);

                },
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )..loadHtmlString(state.url!);
        }
        if(state is MakePaymentState && state.dataState == DataState.loading){



        }
        if(state is MakePaymentState && state.dataState == DataState.error){
          context.router.pop();
          wErrorPopUp(message: state.error!, type: getLocalization().error, context: context);
        }
      },
      builder: (context, state) {
         return state.dataState == DataState.loading || state.dataState == DataState.init?
         const Center(child: CircularProgressIndicator(),)
             : Stack(
               children:[ WebViewWidget(
           controller: webViewController,),
                 Positioned(right: 20,child: InkWell(onTap: ()=> context.router.pop(), child: Icon(Icons.close),))
            ] );
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
