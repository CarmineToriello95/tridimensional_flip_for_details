import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFABA397);
const Color kSecondaryColor = Color(0xFFE7DBCC);
const double kMaxSlide = 650;
const double kDragFromBottomEdge = 500;
const double kDragFromTopEdge = 200;

class Utils {
  static double screenHeight = 0;
}

class AnimationsHandler {
  static AnimationController animationController;

  static showProductDescription() {
    animationController.forward();
  }

  static hideProductDescription() {
    animationController.reverse();
  }
}
