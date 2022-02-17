// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Albums _$AlbumsFromJson(Map<String, dynamic> json) => Albums(
      href: json['href'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int,
      next: json['next'] as String,
      offset: json['offset'] as int,
      previous: json['previous'] as String?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$AlbumsToJson(Albums instance) => <String, dynamic>{
      'href': instance.href,
      'items': instance.items,
      'limit': instance.limit,
      'next': instance.next,
      'offset': instance.offset,
      'previous': instance.previous,
      'total': instance.total,
    };
