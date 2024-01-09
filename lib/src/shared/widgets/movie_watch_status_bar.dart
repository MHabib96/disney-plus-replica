import 'package:flutter/material.dart';

class MovieWatchStatusBar extends StatelessWidget {
  const MovieWatchStatusBar({
    super.key,
    required this.duration,
    required this.watched,
    this.width = 240,
    this.height = 5,
  });

  final int duration;
  final int watched;
  final double width;
  final double height;

  double _getWatchedProgress(double width) {
    var watchedPercentage = (watched / duration) * 100;
    return (watchedPercentage / 100) * width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: height,
            width: _getWatchedProgress(constraints.maxWidth),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
    // return WidgetSize(
    //   builder: (context, size, child) {
    //     return Stack(
    //       children: [
    //         Container(
    //           height: _height,
    //           decoration: BoxDecoration(
    //             color: Colors.grey.shade300.withOpacity(0.6),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //         ),
    //         Container(
    //           height: _height,
    //           width: _getStatusBarValue(size),
    //           decoration: BoxDecoration(
    //             color: Colors.lightBlue.shade300,
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
