import 'package:flutter/material.dart';

 preloader(BuildContext context){
   showDialog(
       barrierDismissible:false,
     context: context,
     builder: (BuildContext context){
      return const SizedBox(
          width: 25,
          height: 25,
          child: Center(child: CircularProgressIndicator()));
     }
  );
}