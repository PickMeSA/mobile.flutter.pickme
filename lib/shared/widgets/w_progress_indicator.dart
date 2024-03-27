import 'package:flutter/material.dart';

typedef LoaderPresentedCallBack = void Function(BuildContext context);

DialogRoute preloader(BuildContext context) {
  var loaderRouter = DialogRoute(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return const SizedBox(
          width: 25,
          height: 25,
          child: Center(child: CircularProgressIndicator()));
    },
  );
  Navigator.push(context, loaderRouter);
  return loaderRouter;
}
