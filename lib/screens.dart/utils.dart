import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFABA397);
const Color kSecondaryColor = Color(0xFFE7DBCC);
const double kMaxSlide = 650;

class Utils {
  static double screenHeight = 0;
}

class AnimationsHandler {
  static AnimationController screensController;

  static showProductDescription() {
    screensController.forward();
  }

  static hideProductDescription() {
    screensController.reverse();
  }
}
