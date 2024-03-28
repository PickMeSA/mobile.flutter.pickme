import 'package:flutter/material.dart';

DialogRoute preloader(BuildContext context) {
  final dialogRoute = DialogRoute(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const SizedBox(
            width: 25,
            height: 25,
            child: Center(child: CircularProgressIndicator()));
      });
  Navigator.push(context, dialogRoute);
  return dialogRoute;
}
