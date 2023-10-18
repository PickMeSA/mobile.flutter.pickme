import 'package:app/components/constants.dart';
import 'package:app/components/palette.dart';
import 'package:app/screens/auth/reset_password_screen.dart';
import 'package:app/widgets/buttons.dart';
import 'package:flutter/material.dart';

Form loginForm({
  required GlobalKey<FormState> loginFormKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required bool hidePassword,
  required Function togglePassword}) {
  return Form(
    key: loginFormKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: emailController,
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
          controller: passwordController,
          obscureText: hidePassword,
          decoration: kTextFieldDecoration.copyWith(
            label: const Text('Password'),
            prefixIcon: const Icon(
              Icons.lock,
              color: Palette.grey,
              size: 20,
            ),
            suffixIcon: GestureDetector(
              onTap: () => togglePassword(),
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
        const SizedBox(height: 10),
        isLoading
            ? spinLoader
            : GestureDetector(
          onTap: () {
            if (loginFormKey.currentState!.validate()) {
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