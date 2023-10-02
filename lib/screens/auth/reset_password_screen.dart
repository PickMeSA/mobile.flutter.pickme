import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../main.dart';
import '../../widgets/buttons.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  Future resetPassword() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: spinLoader,
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.toLowerCase().trim(),
      );
      Utils.showSnackBar(text: 'Password Reset email sent');
      navigatorKey.currentState!.pop();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
    }
    navigatorKey.currentState!.pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'Reset your\nPassword',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Form(
                    key: _resetPasswordFormKey,
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
                        const SizedBox(height: 10),
                        isLoading
                            ? spinLoader
                            : GestureDetector(
                                onTap: () {
                                  if (_resetPasswordFormKey.currentState!.validate()) {
                                    resetPassword();
                                  }
                                },
                                child: greenButton(label: 'Reset Password'),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
