import 'package:disney_plus_replica/src/shared/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class SliverHomeAppBar extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;

  @override
  final double maxExtent;

  final double topPadding;

  SliverHomeAppBar({
    required this.minExtent,
    required this.maxExtent,
    this.topPadding = 0,
  });

  double _getHeaderOpacity(double shrinkOffset, double maxExtent) {
    var opacity = 1.0;
    if (shrinkOffset != maxExtent) {
      opacity = (1 - (shrinkOffset * 2) / maxExtent);
    }
    return opacity < 0
        ? 0
        : opacity > 1
            ? 1
            : opacity;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Opacity(
          opacity: _getHeaderOpacity(shrinkOffset, maxExtent),
          child: Image.asset(kDisneyAppBarLogo, fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
