import 'package:flutter/material.dart';

class sliverpinnedwidgetdelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  sliverpinnedwidgetdelegate({required this.child, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height, // Ensure the child is constrained to the height
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Return true if the delegate changes should rebuild
  }
}
