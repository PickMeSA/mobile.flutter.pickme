import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/palette.dart';

Widget serviceCategory(
    {required String icon,
    required String label,
    required bool selected,
    bool png = false}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            png
                ? Image.asset(
                    icon,
                    height: 60,
                    width: 60,
                  )
                : SvgPicture.asset(icon),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                border: Border.all(
                  width: 2,
                  color: selected ? Palette.green : Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.black26,
          ),
        )
      ],
    ),
  );
}

Widget serviceCategoryAll(
    {required String icon,
    required String label,
    required bool selected,
    bool png = false}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            png
                ? Image.asset(
                    icon,
                    height: 60,
                    width: 60,
                  )
                : SvgPicture.asset(icon),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                border: Border.all(
                  width: 2,
                  color: selected ? Palette.green : Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.black26,
          ),
        )
      ],
    ),
  );
}
