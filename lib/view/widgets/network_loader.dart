import 'package:flutter/material.dart';
import 'package:happify_app/utilities/color_utilities.dart';

class NetworkLoader extends StatelessWidget {
  final Widget child;
  final bool visibility;
  const NetworkLoader({Key? key, required this.child, required this.visibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: visibility,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                ColorUtilities.primaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
