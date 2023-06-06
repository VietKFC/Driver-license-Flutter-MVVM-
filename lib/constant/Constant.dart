import 'package:flutter/material.dart';

class AppConstant {
  static double get smallPadding => 8.0;

  static double get mediumPadding => 16.0;

  static double get largePadding => 24.0;

  static double get smallRadius => 8.0;

  static double get mediumRadius => 16.0;

  static double get largeRadius => 24.0;

  static const TIME_OUT = 10000;

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey888888 = Color(0xFF888888);
  static const violet6602E6 = Color(0xFF6602E6);
  static const green14F5BF = Color(0xFF14F5BF);
  static const amberFFEF25 = Color(0xFFFFEF25);
  static const pinkF34BCE = Color(0xFFF34BCE);
  static const pinkRed = Color(0xFFF9426D);
  static const black262626 = Color(0xFF262626);
  static const black17294C = Color(0xFF17294C);
  static const green53C280 = Color(0xFF53C280);
  static const whiteE3E3E3 = Color(0xFFE3E3E3);
  static const green28CC6A = Color(0xFF28CC6A);
  static const white28CC6A = Color(0xDEFFFFFF); // WHILE 87%
  static const white99FFFFFF = Color(0x99FFFFFF); // WHILE 60%
  static const white60FFFFFF = Color(0x60FFFFFF); // WHILE 38%
  static const blackFF3D3D3D = Color(0xFF3D3D3D); // WHILE 60%
  static const black99000000 = Color(0x99000000);
  static const viewAllGrey60 = Color.fromRGBO(255, 255, 255, 0.6);
  static const viewAllGray38 = Color.fromRGBO(255, 255, 255, 0.38);
  static const viewAllGray87 = Color.fromRGBO(255, 255, 255, 0.87);
  static const backgroundBottomSheet = Color.fromRGBO(38, 38, 38, 1);
  static const colorTextCancel = Color.fromRGBO(255, 255, 255, 0.6);
  static const backgroundDuration = Color.fromRGBO(23, 41, 76, 0.87);
  static const Color whiteGrey = Color(0xFFFDFDFD);
  static const Color dark = Color(0xFF303943);
  static const Color color1A1A1A = Color.fromRGBO(26, 26, 26, 1);

  static String youtubeThumbnail(String key) => "https://img.youtube"
      ".com/vi/$key/0.jpg";
}
