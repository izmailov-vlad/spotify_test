import 'package:json_annotation/json_annotation.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/artist.dart';
import 'package:sporify/core/data/entities/external_ids.dart';
import 'package:sporify/core/data/entities/external_urls.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  Album? album;
  String name;
  List<Artist> artists;
  List<String> available_markets;
  int disc_number;
  int duration_ms;
  bool explicit;
  ExternalIds? external_ids;
  ExternalUrls external_urls;
  String href;
  String id;
  bool? is_playable;
  Track({
    required this.name,
    required this.album,
    required this.artists,
    required this.available_markets,
    required this.disc_number,
    required this.duration_ms,
    required this.explicit,
    required this.external_ids,
    required this.external_urls,
    required this.href,
    required this.id,
    required this.is_playable,
  });
  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
