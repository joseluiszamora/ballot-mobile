import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:flutter/material.dart';

class Styles {
  final colorPrimary = Color(0xff510BA9);
  final colorSecondary = Color(0xff22CEC3);

  final colorAppBar = Color(0xffFFFFFF);
  final colorBottomBar = Color(0xffFFFFFF);

  final colorBackgroundPrimary = Color(0xFFEDF1F9);
  final colorBackgroundSecondary = Color(0xFFEDF1F9);
  final colorInactive = Colors.black38;

  final fontColor = Color(0XFF485068);

  final double fontSizeH2 = 40.0;
  final double fontSizeH3 = 30.0;
  final double fontSizeH4 = 20.0;
  final double fontSizeH5 = 15.0;

  BoxDecoration backgroundMain() => BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [colorBackgroundPrimary, colorBackgroundSecondary],
      ));

  BoxDecoration bottomBarMain() => BoxDecoration(
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                spreadRadius: 1.0,
                offset: new Offset(0.0, 1.0))
          ],
          color: Styles().colorBottomBar,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)));

  TextStyle titleOne() => TextStyle(
      fontSize: fontSizeH3, fontWeight: FontWeight.bold, color: fontColor);

  TextStyle titleTwo() => TextStyle(
      fontSize: fontSizeH4, fontWeight: FontWeight.bold, color: fontColor);
  TextStyle textOne() => TextStyle(fontSize: fontSizeH5, color: fontColor);
  TextStyle textTwo() => TextStyle(fontSize: fontSizeH4, color: fontColor);

  ButtonTextStyle buttonStyleOne() => ButtonTextStyle(
      selectedColor: Colors.white,
      unSelectedColor: colorInactive,
      textStyle: titleTwo());
}
