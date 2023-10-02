import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'palette.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kAppBarTitleTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
);

const kHeadingTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const kLinkTextStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kTextFieldStyle = TextStyle(color: Colors.black);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(250, 250, 250, 1),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Palette.lightGrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Palette.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  hintStyle: TextStyle(color: Colors.grey),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

SpinKitCircle spinLoader = SpinKitCircle(
  size: 75.0,
  itemBuilder: (context, index) {
    final colors = [Palette.green, Palette.lightGreen];
    final color = colors[index % colors.length];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  },
);
