import 'package:disney_plus_replica/src/shared/utilities/widget_size.dart';
import 'package:flutter/material.dart';

class MovieWatchStatusBar extends StatelessWidget {
  const MovieWatchStatusBar({
    super.key,
    required this.duration,
    required this.watched,
  });

  final int duration;
  final int watched;

  final double _height = 5;

  double _getStatusBarValue(Size size) {
    var watchedPercentage = (watched / duration) * 100;
    return (watchedPercentage / 100) * size.width;
  }

  @override
  Widget build(BuildContext context) {
    return WidgetSize(
      builder: (context, size, child) {
        return Stack(
          children: [
            Container(
              height: _height,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: _height,
              width: _getStatusBarValue(size),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        );
      },
    );
  }
}
