// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'images': instance.images,
    };
