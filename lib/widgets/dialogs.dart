import 'package:flutter/material.dart';

class Dialogs {
  static showLoadingDialog(
      {required BuildContext context, required String text}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CircularProgressIndicator(color: Palette.funaPurple),
              // const SizedBox(height: 20),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  static showAlert(
      {required BuildContext context,
      required String title,
      required String message}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
