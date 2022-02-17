
import 'package:json_annotation/json_annotation.dart';

import 'package:sporify/core/data/entities/images.dart';

part 'artists.g.dart';

@JsonSerializable()
class Artists {
  List<Images>? images;
  Artists({
    required this.images,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => _$ArtistsFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistsToJson(this);
}
