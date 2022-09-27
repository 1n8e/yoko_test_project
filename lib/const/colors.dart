import 'package:flutter/material.dart';

class ConstColors {

  static final fieldBorderColor = Color(0xffFFFFFF).withOpacity(.8);

  static final buttonColor = Color(0xffFFFFFF);

  static const bgLinearGradien = LinearGradient(
    colors: [
      Color(0xff5E94E1),
      Color(0xff5C91DE),
      Color(0xff5A8FDB),
      Color(0xff4271B5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const buttonLinearGradient = LinearGradient(
    colors: [Color(0xff4D42B5), Color(0xff5E94E1)],
  );
}
