import 'package:flutter/material.dart';

import '../../res/measurement.dart';

class AppDecorations {
  static BoxDecoration get smallRoundCornerWhite => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            measurement.margin(12),
          ),
        ),
      );

  static BoxDecoration get smallRoundCornerShadow =>
      smallRoundCornerWhite.copyWith(
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.2),
            offset: Offset(1, 2),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      );
}

BoxDecoration dynamicColorDecoration(Color statusColor) {
  return BoxDecoration(
    color: statusColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(4),
    ),
  );
}
