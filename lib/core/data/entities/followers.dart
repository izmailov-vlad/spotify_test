import 'package:json_annotation/json_annotation.dart';
part 'followers.g.dart';
@JsonSerializable()
class Followers {
  String href;
  int total;
  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => _$FollowersFromJson(json);
  Map<String, dynamic> toJson() => _$FollowersToJson(this);
}
