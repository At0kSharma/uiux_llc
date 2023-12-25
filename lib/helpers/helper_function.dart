import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperFunctions {
  // static Color? getColor(String value) {
  //   if (value == 'Green') {
  //     return Colors.green;
  //   } else if (value == 'Red') {
  //     return Colors.red;
  //   } else if (value == 'Blue') {
  //     return Colors.blue;
  //   } else if (value == 'Pink') {
  //     return Colors.pink;
  //   } else if (value == 'Grey') {
  //     return Colors.grey;
  //   } else if (value == 'Purple') {
  //     return Colors.purple;
  //   } else if (value == 'Black') {
  //     return Colors.black;
  //   }
  // }

  static void showSnackBar(String meggage) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(meggage),
      ),
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
