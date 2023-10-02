import 'package:flutter/material.dart';

import '../components/palette.dart';

Container greenButton({required String label, icon}) {
  return Container(
    decoration: BoxDecoration(
      gradient: Palette.greenButtonGradient,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (icon != null) icon,
          Expanded(
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Container greyButton({required String label}) {
  return Container(
    decoration: BoxDecoration(
      color: Palette.grey,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Container smallGreenButton({required String label}) {
  return smallButton(
      label: label, color: Palette.green, textColor: Colors.white);
}

Container smallLightGreenButton({required String label}) {
  return smallButton(
      label: label,
      color: Palette.green.withOpacity(0.2),
      textColor: Palette.green);
}

Container smallWhiteButton({required String label}) {
  return smallButton(
      label: label,
      color: Colors.white,
      textColor: Palette.green,
      border: Palette.green);
}

Container smallButton(
    {required String label,
    required Color color,
    Color? border,
    required Color textColor}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: border ?? color, width: border != null ? 2 : 0),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: border != null ? 6 : 8),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
