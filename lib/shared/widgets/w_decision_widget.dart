

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/shared/widgets/w_text.dart';

 wDecisionWidget({
   required ThemeData theme,
required Function leftButton,
required Function rightButton,
required String leftButtonCaption,
required String rightButtonCaption,
required String message,
required String title,
 required BuildContext context}){
  showDialog(context: context, builder: (BuildContext context){
    return SizedBox(
      height: 150,

      child: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height/3, bottom: 320),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wText(title,style: theme.textTheme.titleMedium),
                10.height,
                wText(message,style: theme.textTheme.titleSmall),
                20.height,
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                              return BorderSide(
                                color:
                                theme.colorScheme.secondary,
                                width: 2,
                              );
                            }
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                    (Set<MaterialState> states){
                                  return
                                    Colors.white;
                                }
                            )
                        ),
                        onPressed: () => leftButton(),
                        child: Text(leftButtonCaption,
                          style: TextStyle(color: theme.colorScheme.secondary),),
                      ),
                    ),
                    10.width,
          Expanded(
            child: PrimaryButton(
              style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                    return BorderSide(
                      color:
                      theme.colorScheme.primary,
                      width: 2,
                    );
                  }
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states){
                        return
                          theme.colorScheme.primary;
                      }
                  )
              ),
              onPressed: ()=> rightButton(),
              child: Text(rightButtonCaption,
                style: TextStyle(color: Colors.white),),
            ),
          ),
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    );
  });
}