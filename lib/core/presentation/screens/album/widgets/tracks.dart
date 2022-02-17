import 'package:flutter/material.dart';
import 'package:sporify/core/data/entities/track.dart';

class TracksList extends SliverChildBuilderDelegate {
  final List<Track> tracks;
  TracksList(
    NullableIndexedWidgetBuilder builder, {
    required this.tracks,
  }) : super(builder);

  @override
  Widget build(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tracks[index].name,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
