import 'package:flutter/material.dart';

import '../../../../core/core_export.dart';
import '../../../../res/measurement.dart';

Widget starAndLangWidget({required int starCount, required String language}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star_border_outlined,
        size: measurement.margin(16),
      ),
      customText(text: "$starCount", textStyle: AppTextStyle().w400s12()),
      customText(
          text: language,
          left: measurement.margin(10),
          textStyle: AppTextStyle().w400s12(AppColors().blue750))
    ],
  );
}
