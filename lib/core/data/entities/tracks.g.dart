// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      href: json['href'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int?,
      next: json['next'] as String?,
      offset: json['offset'] as int?,
      previous: json['previous'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };
