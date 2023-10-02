import 'dart:async';
import 'dart:math';

import 'package:app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../components/constants.dart';
import '../../components/palette.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _otpFormKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool isLoading = false;
  late String otp;
  bool validOtp = false;
  int timeToResend = 5;
  Timer? timer;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (timeToResend == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          timeToResend--;
        });
      }
    });
  }

  sendOTP() {
    otp = '1234';
  }

  @override
  void initState() {
    super.initState();
    sendOTP();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Forgot Password'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _otpFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Code has been sent to\nemail@domain.com',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.center,
                        pinTheme: PinTheme(
                          fieldOuterPadding: const EdgeInsets.all(10),
                          shape: PinCodeFieldShape.box,
                          borderWidth: 0.4,
                          activeFillColor: Palette.green.withOpacity(0.2),
                          activeColor: Palette.green.withOpacity(0.2),
                          selectedFillColor: Palette.green.withOpacity(0.25),
                          selectedColor: Palette.green,
                          inactiveFillColor: Palette.lightGrey,
                          inactiveColor: Palette.grey,
                          fieldHeight: 50,
                          fieldWidth: 50,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                      const SizedBox(height: 20),
                      timeToResend != 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Resend code in "),
                                Text(
                                  timeToResend.toString(),
                                  style: const TextStyle(color: Palette.green, fontWeight: FontWeight.bold),
                                ),
                                const Text(" s"),
                              ],
                            )
                          : TextButton(
                              onPressed: () async {
                                // setState(() {
                                //   isLoading = true;
                                // });
                                otp = (Random().nextInt(9000) + 1000).toString();
                                // await sendOtp(user.userMobile, otp);
                                // setState(() {
                                //   isLoading = false;
                                // });
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) => ResentOtpMessage(),
                                // );
                              },
                              child: const Text(
                                'Request Again',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: isLoading
                    ? spinLoader
                    : GestureDetector(
                        onTap: () {
                          if (_otpController.text == otp) {
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => LockScreen()),
                            //   (Route<dynamic> route) => false,
                            // );
                          } else {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) => InvalidOtpMessage(),
                            // );
                          }
                        },
                        child: greenButton(label: 'Verify')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
