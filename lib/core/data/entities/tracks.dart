import 'package:json_annotation/json_annotation.dart';

import 'package:sporify/core/data/entities/track.dart';

part 'tracks.g.dart';

@JsonSerializable()
class Tracks {
  String? href;
  List<Track>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  Tracks({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });
  factory Tracks.fromJson(Map<String, dynamic> json) => _$TracksFromJson(json);
  Map<String, dynamic> toJson() => _$TracksToJson(this);
}
