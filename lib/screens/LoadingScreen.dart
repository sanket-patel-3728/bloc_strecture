import 'dart:ui';

import 'package:flutter/material.dart';

import 'widgets/loading_widget.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final Widget? progressWidget;
  final bool isProgressRunning;
  String progressText;
  final double progressWidgetOpacity;

  LoadingScreen(
      {required this.child,
      required this.isProgressRunning,
      this.progressText = "Please Wait",
      this.progressWidgetOpacity = 0.5,
      this.progressWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Visibility(
            visible: isProgressRunning,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                  color: Colors.grey.withOpacity(progressWidgetOpacity),
                  child: progressWidget ?? ProgressWidget(this.progressText)),
            )),
      ],
    );
  }
}
