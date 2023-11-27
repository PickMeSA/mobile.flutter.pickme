import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

 appTimePicker(BuildContext context, controller){
  showDialog(context: context, builder: (context){
    return AppTimePicker();
  });
}