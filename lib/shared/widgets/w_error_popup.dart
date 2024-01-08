import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

 wErrorPopUp({
  required String message,
   required String type,
required BuildContext context}) {
   showDialog(context: context,
      builder: (BuildContext context){
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 100 ,
              child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),

                  ),
                  Expanded(child:
                  Container(
                    height: 120,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width* 0.7,
                        child: Row(
                          children: [
                            Icon(Icons.error, color: Colors.red.shade700,size: 50,),
                            30.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wText(type),
                                wText(message)],
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                  ),

                ],
              ),
            ),
          ),
        );
      });
}