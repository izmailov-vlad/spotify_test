import 'package:sporify/core/data/entities/artists.dart';
import 'package:sporify/core/data/entities/external_urls.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sporify/core/data/entities/images.dart';
import 'package:sporify/core/data/entities/tracks.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  Album({
    required this.album_type,
    required this.artists,
    required this.available_markets,
    required this.external_urls,
    required this.href,
    required this.id,
    required this.images,
    required this.tracks,
    required this.name,
    required this.release_date,
    required this.release_date_precision,
    required this.total_tracks,
    required this.type,
    required this.uri,
  }); 

  String album_type;
  List<Artists> artists;
  List<String> available_markets;
  ExternalUrls external_urls;
  String href;
  String id;
  Tracks? tracks;
  List<Images> images;
  String name;
  String release_date;
  String release_date_precision;
  int total_tracks;
  String type;
  String uri;
  
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
