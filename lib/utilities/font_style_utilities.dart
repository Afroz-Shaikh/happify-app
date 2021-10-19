import 'package:flutter/material.dart';
import 'package:happify_app/utilities/color_utilities.dart';

/// THIS ENUM IS USED TO MANAGE FONT_WEIGHT...
enum FWT {
  light,
  regular,
  medium,
  semiBold,
  bold,
}

/// THIS CLASS IS USED TO MANAGE FONT_STYLES USED IN THE APPLICATION...
class FontStyleUtilities {
  /// THIS FUINCTION RETURNS FONT_WEIGHT ACCORDING TO USER REQUIREMENT(FROM ENUM)...
  static FontWeight getFontWeight({FWT fontWeight = FWT.regular}) {
    switch (fontWeight) {
      case FWT.bold:
        return FontWeight.w700;
      case FWT.semiBold:
        return FontWeight.w600;
      case FWT.medium:
        return FontWeight.w500;
      case FWT.regular:
        return FontWeight.w400;
      case FWT.light:
        return FontWeight.w300;
      default:
        return FontWeight.w400;
    }
  }

  /// FONTSTYLE FOR FONT SIZE 8
  static TextStyle h8({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 8,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 10
  static TextStyle h10({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 10,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 12
  static TextStyle h12({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 12,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 420.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 14
  static TextStyle h14({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 14,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 16
  static TextStyle h16({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 16,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 350.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 18
  static TextStyle h18({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 18,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 420.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 20
  static TextStyle h20({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 20,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 400.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 22
  static TextStyle h22({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 22,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 24
  static TextStyle h24({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 24,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 44
  static TextStyle h44({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 44,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 400.0, 70.0),
            )),
    );
  }

  /// FONTSTYLE FOR FONT SIZE 50
  static TextStyle h50({
    Color? fontColor,
    FWT fontWeight = FWT.regular,
    List<Color>? gradient,
  }) {
    return TextStyle(
      color: gradient != null
          ? null
          : fontColor ?? ColorUtilities.primaryTextColor,
      fontWeight: getFontWeight(fontWeight: fontWeight),
      fontSize: 50,
      foreground: gradient == null
          ? null
          : (Paint()
            ..shader = (LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )).createShader(
              Rect.fromLTWH(0.0, 0.0, 500.0, 50.0),
            )),
    );
  }
}
