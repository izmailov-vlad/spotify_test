import 'package:json_annotation/json_annotation.dart';
part 'external_ids.g.dart';

@JsonSerializable()
class ExternalIds {
  String isrc;
  String ean;
  String ups;
  ExternalIds({
    required this.isrc,
    required this.ean,
    required this.ups,
  });
  factory ExternalIds.fromJson(Map<String, dynamic> json) => _$ExternalIdsFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}
