import 'package:json_annotation/json_annotation.dart';
part 'external_urls.g.dart';
@JsonSerializable()
class ExternalUrls {
  String spotify;
  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
}
