import 'package:json_annotation/json_annotation.dart';

import 'package:sporify/core/data/entities/albums.dart';

part 'new_releases.g.dart';

@JsonSerializable()
class NewReleases {
  Albums albums;
  NewReleases({
    required this.albums,
  });
  factory NewReleases.fromJson(Map<String, dynamic> json) => _$NewReleasesFromJson(json);
  Map<String, dynamic> toJson() => _$NewReleasesToJson(this);
}
