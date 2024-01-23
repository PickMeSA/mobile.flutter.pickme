import 'package:flutter/material.dart';
import 'package:pickme/shared/widgets/w_text.dart';

Widget headingButton({
  required String  buttonCaption,
  required Widget icon,
  required Function onClick
}){
  return InkWell(
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
  );
}