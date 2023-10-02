import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../widgets/buttons.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _changePasswordFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  updateUserPassword({required String password}) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Change Password'),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _changePasswordFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _passwordController,
                            textInputAction: TextInputAction.next,
                            decoration: kTextFieldDecoration.copyWith(
                              label: const Text('Old Password'),
                            ),
                            validator: (val) {
                              return val!.isEmpty ? 'Please enter your old password' : null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _newPasswordController,
                            textInputAction: TextInputAction.next,
                            decoration: kTextFieldDecoration.copyWith(
                              label: const Text('New Password'),
                            ),
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'Please enter your new password'
                                  : val != _confirmNewPasswordController.text
                                      ? 'Passwords do not match'
                                      : null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _confirmNewPasswordController,
                            textInputAction: TextInputAction.next,
                            decoration: kTextFieldDecoration.copyWith(
                              label: const Text('Confirm New Password'),
                            ),
                            validator: (val) {
                              return val!.isEmpty
                                  ? 'Please confirm your new password'
                                  : val != _newPasswordController.text
                                      ? 'Passwords do not match'
                                      : null;
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (!keyboardOpen)
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: isLoading
                      ? spinLoader
                      : GestureDetector(
                          onTap: () async {
                            if (_changePasswordFormKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              final user = await FirebaseAuth.instance.currentUser;
                              print(user!.email);
                              try {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: user.email!,
                                  password: _passwordController.text.trim(),
                                );
                                try {
                                  await updateUserPassword(password: _newPasswordController.text.trim());
                                } on FirebaseAuthException catch (e) {
                                  print('UPDATE PASSWORD ERROR');
                                  Utils.showSnackBar(text: e.message);
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                print('OLD PASSWORD ERROR');
                                Utils.showSnackBar(text: e.message);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            }
                          },
                          child: greenButton(label: 'Change Password'),
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
