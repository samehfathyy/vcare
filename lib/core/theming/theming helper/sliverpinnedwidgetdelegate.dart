import 'package:flutter/material.dart';

class sliverpinnedwidgetdelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  sliverpinnedwidgetdelegate(this.height, {required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => height;
  @override
  // TODO: implement minExtent
  double get minExtent => height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
