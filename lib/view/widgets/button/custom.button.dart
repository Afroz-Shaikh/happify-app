import 'package:flutter/material.dart';
import 'package:happify_app/utilities/utilities.dart';

/// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final String? secondTitle;
  final String? preffixIcon;
  final String? suffixIcon;
  final bool isFlatButton;
  final Color? buttonColor;
  final VoidCallback? onButtonTap;
  final TextStyle? titleStyle;
  final TextStyle? secondTitleStyle;
  CustomButton({
    Key? key,
    this.height,
    this.width,
    this.title,
    this.preffixIcon,
    this.suffixIcon,
    this.isFlatButton = false,
    this.buttonColor,
    this.onButtonTap,
    this.secondTitle,
    this.titleStyle,
    this.secondTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap ?? () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height ?? 56,
        width: width,
        decoration: BoxDecoration(
          color: ColorUtilities.blueTextColor,

          // gradient: LinearGradient(
          //   colors: isFlatButton
          //       ? [
          //           ColorUtilities.secondaryBgColor,
          //           ColorUtilities.secondaryBgColor
          //         ]
          //       : ColorUtilities.buttomGradiantColor,
          //   begin: Alignment.topLeft,
          //   end: Alignment(0.5, 1),
          // ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: preffixIcon != null ? 20 : 0),
            Text(
              title ?? '',
              style: titleStyle ??
                  FontStyleUtilities.h18(
                    fontColor: isFlatButton
                        ? ColorUtilities.primaryTextColor
                        : ColorUtilities.whiteTextColor,
                    fontWeight: FWT.semiBold,
                  ),
            ),
            SizedBox(width: suffixIcon != null ? 20 : 1),
            secondTitle != null ? Spacer() : SizedBox(),
            secondTitle != null
                ? Text(
                    secondTitle ?? '',
                    style: secondTitleStyle ??
                        FontStyleUtilities.h14(
                          fontColor: isFlatButton
                              ? ColorUtilities.primaryTextColor
                              : ColorUtilities.whiteTextColor,
                          fontWeight: FWT.semiBold,
                        ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
