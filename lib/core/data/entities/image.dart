import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';
@JsonSerializable()
class Image {
  String url;
  int height;
  int width;
  Image({
    required this.url,
    required this.height,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
