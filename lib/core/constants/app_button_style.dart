import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/color_palette.dart';

// final deviceHeight = MediaQuery.of(context).size.height;
//     final deviceWidht = MediaQuery.of(context).size.width;
//     final height10 = deviceHeight * 0.0118563686;
//     final width10 = deviceWidht * 0.0243055556;

class AppButtonStyle {
  static Container ElevatedButtonStyled(
    String theme,
    Widget child,
    void Function() onPressed,
  ) {
    return Container(
        padding: EdgeInsets.symmetric(
          // vertical: 14 * SizeConfig.heightMultiplier!,
          vertical: 14,
        ),
        width: Get.width,
        height: Get.height * 0.1,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.toUpperCase() == 'LIGHT' ? white : theme.toUpperCase() == 'GREEN' ? green : orange,
            elevation: 0,
            // padding: EdgeInsets.symmetric(
            //     vertical: 16 * SizeConfig.heightMultiplier!),
            side: theme.toUpperCase() == 'DARK' || theme.toUpperCase() == 'GREEN'
                ? null
                : const BorderSide(color: orange),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          child: child,
        ));
  }

  static Container ElevatedButtonStyledUnchecked(
    String theme,
    Widget child,
    void Function() onPressed,
  ) {
    return Container(
        width: Get.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.toUpperCase() == 'LIGHT' ? white : orange,
            elevation: 0,
            padding: EdgeInsets.symmetric(
                // vertical: 16 * SizeConfig.heightMultiplier!),
                vertical: 16),
            side: theme.toUpperCase() == 'DARK'
                ? null
                : const BorderSide(color: orange),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          child: child,
        ));
  }
}
