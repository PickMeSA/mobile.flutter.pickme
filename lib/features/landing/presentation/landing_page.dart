import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/landing/presentation/bloc/landing_bloc.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

@RoutePage()
class LandingPage extends BasePage{
  const LandingPage({super.key});


  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends BasePageState<LandingPage, LandingBloc>{
  @override
  Widget buildView(BuildContext context) {
   return Container(color: Colors.white,height: MediaQuery.sizeOf(context).height, width: MediaQuery.sizeOf(context).width,);
  }

  @override
  LandingBloc initBloc() {
    return locator<LandingBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
  @override
  Widget? floatingActionButton() {
    return SizedBox(height:  160,
      child: Column(
        children: [
          ElevatedButton(onPressed: () async {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+27810434369',
              verificationCompleted: (PhoneAuthCredential credential) {
                final fCredential = credential;

              },
              verificationFailed: (FirebaseAuthException e) {
                final fFailure = e;
              },
              codeSent: (String verificationId, int? resendToken) {},
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          }, child: Text("Test")),

          ElevatedButton(onPressed: () async {


            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+27810434369',
              timeout: const Duration(minutes: 1),
              autoRetrievedSmsCodeForTesting:"984596",
              verificationCompleted: (PhoneAuthCredential credential) async{
                final fCredential = credential;
                await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
                await value.user!.getIdToken(true).then((value1) => print(value1));
                });
              },
              verificationFailed: (FirebaseAuthException e) {
                final fFailure = e;
              },
              codeSent: (String verificationId, int? resendToken) {},
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          }, child: Text("Test")),
        ],
      ),
    );
  }

}