import 'package:flutter/material.dart';
import 'package:pickme/shared/widgets/w_text.dart';

Widget labelledPanel ({required String labelText, required Widget content}){
  return Container(
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.black),),
          child: content,
      ),
        ),
       Positioned(
         top: 10,
         left: 15,
         child: Container(color: Colors.white,child: Padding(
           padding: const EdgeInsets.only(right: 5, left: 5),
           child: wText(labelText),
         )),
       )],
    ),
  );
}