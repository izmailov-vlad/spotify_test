import 'package:flutter/material.dart';

class AlbumImage extends SliverPersistentHeaderDelegate {
  final String photoUrl;
  final double maxSize;
  final double minSize;

  const AlbumImage({
    required this.photoUrl,
    required this.maxSize,
    required this.minSize,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        photoUrl,
      ),
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => minSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
