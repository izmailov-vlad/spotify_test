import 'package:json_annotation/json_annotation.dart';

import 'package:sporify/core/data/entities/external_urls.dart';
import 'package:sporify/core/data/entities/followers.dart';
import 'package:sporify/core/data/entities/image.dart';


part 'artist.g.dart';

@JsonSerializable()
class Artist {
  ExternalUrls external_urls;
  Followers? followers;
  List<String>? genres;
  String href;
  String id;
  List<Image>? images;
  String name;
  int? popularity;
  String type;
  String uri;
  Artist({
    required this.external_urls,
    required this.followers,
    required this.genres,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
    required this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}
