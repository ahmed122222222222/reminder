

import 'package:ah/core/Sizeconfig.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle stylebold24(context) {
    return TextStyle(
     color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle stylebold15(context) {
    return TextStyle(
     color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle stylebold20(context) {
    return TextStyle(
     color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'cairo',
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle stylesemi20(context) {
    return TextStyle(
     color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'cairo',
      fontWeight: FontWeight.w700,
    );
 
  }

 
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}