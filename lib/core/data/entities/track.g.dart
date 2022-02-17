// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      name: json['name'] as String,
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      available_markets: (json['available_markets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      disc_number: json['disc_number'] as int,
      duration_ms: json['duration_ms'] as int,
      explicit: json['explicit'] as bool,
      external_ids: json['external_ids'] == null
          ? null
          : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      external_urls:
          ExternalUrls.fromJson(json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      is_playable: json['is_playable'] as bool?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'album': instance.album,
      'name': instance.name,
      'artists': instance.artists,
      'available_markets': instance.available_markets,
      'disc_number': instance.disc_number,
      'duration_ms': instance.duration_ms,
      'explicit': instance.explicit,
      'external_ids': instance.external_ids,
      'external_urls': instance.external_urls,
      'href': instance.href,
      'id': instance.id,
      'is_playable': instance.is_playable,
    };
