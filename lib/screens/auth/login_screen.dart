import 'dart:developer';

import 'package:app/screens/auth/reset_password_screen.dart';
import 'package:app/screens/register/register.dart';
import 'package:app/screens/webview_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../main.dart';
import '../../models/user_model.dart';
import '../../widgets/buttons.dart';
import '../main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool isLoading = false;
  bool? rememberMe = false;
  bool keyboardOpen = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  Future signIn() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((snapshot) async {
        final status = await OneSignal.shared.getDeviceState();
        final String? osUserID = status?.userId;
        log("ONE SIGNAL: ${osUserID.toString()}");
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          'pushToken': osUserID,
        });

        if (snapshot.exists) {
          if (!snapshot.data()!["enabled"]) {
            await FirebaseAuth.instance.signOut();
            Utils.showSnackBar(text: 'Your account is pending review.');
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainScreen()));
          }
        }
      });
    }
  }

  Form loginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Email'),
              prefixIcon: const Icon(
                Icons.email,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter Email' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passwordController,
            obscureText: hidePassword,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Password'),
              prefixIcon: const Icon(
                Icons.lock,
                color: Palette.grey,
                size: 20,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePassword();
                },
                child: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,
                  color: hidePassword ? Palette.grey : Palette.green,
                  size: 20,
                ),
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter Password' : null;
            },
          ),
          // const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Checkbox(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //       value: rememberMe,
          //       onChanged: (newValue) {
          //         setState(() {
          //           rememberMe = newValue;
          //         });
          //       },
          //     ),
          //     const Text('Remember me')
          //   ],
          // ),
          const SizedBox(height: 10),
          isLoading
              ? spinLoader
              : GestureDetector(
                  onTap: () {
                    if (_loginFormKey.currentState!.validate()) {
                      signIn();
                    }
                  },
                  child: greenButton(label: 'Sign In'),
                ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen()));

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => WebViewScreen(
              //             url:
              //                 'https://pickme.mont6.co.za/api/payfast/checkout/booking/16mNOaAxyOCSgJ7OmzWi/100/fransrmalan@gmail.com')));
            },
            child: Text('Forgot the password?'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((isVisible) {
      if (isVisible) {
        if (mounted) {
          setState(() {
            keyboardOpen = true;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            keyboardOpen = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !keyboardOpen,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Login to your\nAccount',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(20), child: loginForm()),
                ),
              ),
              Visibility(
                visible: !keyboardOpen,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?  ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Palette.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
