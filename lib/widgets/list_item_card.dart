import 'package:flutter/material.dart';

Container ListItemCard(Widget child) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 15,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: child,
  );
}

Container userCard(Widget child) {
  return Container(
    padding: const EdgeInsets.only(top: 10),
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 15,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: child,
  );
}
