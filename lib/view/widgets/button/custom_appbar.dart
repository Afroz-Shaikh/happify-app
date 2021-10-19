import 'package:flutter/material.dart';
import 'package:happify_app/utilities/utilities.dart';

class CustomAppbar extends StatelessWidget {
  final String appBarTitle;
  final VoidCallback? onBackTap;
  const CustomAppbar({Key? key, required this.appBarTitle, this.onBackTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onBackTap != null
                  ? IconButton(
                      onPressed: onBackTap,
                      icon: Icon(Icons.arrow_back_ios_new))
                  : SizedBox(),
              Text(
                appBarTitle,
                textAlign: TextAlign.center,
                style: FontStyleUtilities.h22(fontWeight: FWT.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
