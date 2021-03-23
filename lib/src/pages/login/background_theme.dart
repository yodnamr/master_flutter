
import 'package:flutter/material.dart';

class BackGroundTheme{
  const BackGroundTheme();

  static const _gradientStart = const Color(0XFF36D1DC);
  static const _gradientEnd = const Color(0xFF5B86E5);

  get gradientStart => _gradientStart;
  get gradientEnd => _gradientEnd;

  static const gradient = LinearGradient(
    colors: [
      _gradientStart,
      _gradientEnd,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}