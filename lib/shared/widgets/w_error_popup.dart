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
                        color: dangerColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),

                  ),
                  Expanded(child:
                  Container(
                    height: 120,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 90,
                        width: MediaQuery.sizeOf(context).width* 0.9,
                        child: Row(
                          children: [
                            const Icon(Icons.error, color: dangerColor,size: 50,),
                            15.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wText(type, style: TextStyle(fontSize: 16)),
                                SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                    height: 67 ,
                                    child: wText(message,style: TextStyle(fontSize: 12)))],
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