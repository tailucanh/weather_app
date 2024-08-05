import 'package:flutter/material.dart';
class AppHelpers {

  static String POPPINS_FONT = "Poppins";

  static double getSizeWithDevice(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getSizeHeightDevice(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static bool isStringNotEmpty(String input) {
    if (input.isNotEmpty) {
      return true;
    }
    return false;
  }


  static bool isStringContains(String input,String value) {
    if (input.contains(value)) {
      return true;
    }
    return false;
  }

}
