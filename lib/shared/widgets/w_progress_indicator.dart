import 'package:flutter/material.dart';

 preloader(BuildContext context){
   showDialog(
     context: context,
     builder: (BuildContext context){
      return const SizedBox(
          width: 25,
          height: 25,
          child: Center(child: CircularProgressIndicator()));
     }
  );
}