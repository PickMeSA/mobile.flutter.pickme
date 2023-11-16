import 'package:flutter/material.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

Widget qualificationSlab({
  required Widget icon,
  required String caption,
  required String buttonCaption,
  required Function onClick}){
  return Column(
    children: [
      Row(
          children:[
            Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: icon),
            const SizedBox(width: 30 ),
            wText(caption,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)
            )
          ]
      ),

      const SizedBox(height: 20,),
      InkWell(
        onTap: ()=> onClick(),
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8, left:  16),
                child: Icon(Icons.add),
              ),
              const SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: wText(buttonCaption,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}