import 'package:json_annotation/json_annotation.dart';
import 'package:sporify/core/data/entities/album.dart';

part 'albums.g.dart';

@JsonSerializable()
class Albums {
  String href;
  List<Album> items;
  int limit;
  String next;
  int offset;
  String? previous;
  int total;
  Albums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => _$AlbumsFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumsToJson(this);
}
