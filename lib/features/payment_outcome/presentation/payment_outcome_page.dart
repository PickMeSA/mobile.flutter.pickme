
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

import 'bloc/payment_outcome_bloc.dart';

@RoutePage()
class PaymentOutcomePage extends BasePage {
  int from = 0;
  bool paymentSuccess = false;
   PaymentOutcomePage({required this.from ,required this.paymentSuccess,super.key});

  @override
  _PaymentOutcomePageState createState() => _PaymentOutcomePageState();
}

class _PaymentOutcomePageState extends BasePageState<PaymentOutcomePage, PaymentOutcomeBloc> {

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
    return BlocConsumer<PaymentOutcomeBloc, PaymentOutcomePageState>(
      listener: (context, state){},
      builder: (context, state){
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

              wText(widget.paymentSuccess?getLocalization().paymentSuccessful: getLocalization().paymentUnsuccessful,style:theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.black
              )),
              20.height,
              wText(widget.paymentSuccess? getLocalization().yourPaymentWasSuccessful: getLocalization().oopsSomethingWentWrongWithYourPayment),
              20.height,
              widget.paymentSuccess?
              SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned(child: Image.asset('assets/payment_successful_pebble.png')),
                      Positioned(top: 50,right: 30 ,child: Image.asset('assets/payment_successful_vector.png')),
                      Positioned(top: 50,right: 50,child: Image.asset('assets/payment_successful_tick.png')),
                      Positioned(right: 50 ,top: 100,child: Image.asset('assets/payment_successful_man.png')),
                   ],
                  )
              ):
              SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned(child: Image.asset('assets/payment_failure_pebble.png')),
                      Positioned(top: 50,right: 30 ,child: Image.asset('assets/payment_failure_vector.png')),
                      Positioned(top: 50,right: 50,child: Image.asset('assets/payment_failure_cross.png')),
                      Positioned(right: 50 ,top: 100,child: Image.asset('assets/payment_failure_man.png')),
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
                        // for setup profile route
                       if(widget.from == 0  && widget.paymentSuccess){
                         context.router.pushAndPopUntil( YouAreAllSetupRoute(), predicate: (Route<dynamic> route) => false);
                       }else if ( widget.from == 0 && !widget.paymentSuccess){
                         context.router.pop();
                         context.router.pop();
                       }

                       //for my wallet pay someone route
                       if(widget.from == 1  && widget.paymentSuccess){
                         context.router.pop();
                         context.router.pop();
                         context.router.pop();
                       }else if ( widget.from == 1 && !widget.paymentSuccess){
                         context.router.pop();
                         context.router.pop();
                       }

                       //for job details route
                       if(widget.from == 2  && widget.paymentSuccess){
                         context.router.pushAndPopUntil( BottomNavigationBarRoute(initialIndex: 1), predicate: (Route<dynamic> route) => false);
                       }else if ( widget.from == 2 && !widget.paymentSuccess){
                         context.router.pop();
                         context.router.pop();
                       }
                      },
                      child:
                      widget.from == 0 ?
                      Text(widget.paymentSuccess?getLocalization().ccontinue: getLocalization().backToSetUpProfile, style: TextStyle(color: theme.colorScheme.secondary),):
                      widget.from == 1?
                      Text(widget.paymentSuccess?getLocalization().backToMyWallet: getLocalization().backToPaySomeone, style: TextStyle(color: theme.colorScheme.secondary),):

                      Text(widget.paymentSuccess?getLocalization().backToBooking: getLocalization().backToPaySomeone, style: TextStyle(color: theme.colorScheme.secondary),)
                      ,
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
  PaymentOutcomeBloc initBloc() {
    return locator<PaymentOutcomeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
