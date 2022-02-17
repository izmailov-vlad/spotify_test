import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sporify/resources/url_path.dart';

part 'account.g.dart';

@RestApi(baseUrl: accountsUrl)
abstract class AccountClient {
  factory AccountClient(Dio dio, {String baseUrl}) = _AccountClient;

  @POST("api/token")
  Future<Config> getToken(
    @Body() Map<String, dynamic> body,
  );
}

@JsonSerializable()
class Config {
  String access_token;
  String token_type;
  int expires_in;
  String? refresh_token;
  String? scope;

  Config({
    required this.access_token,
    required this.token_type,
    required this.expires_in,
    required this.refresh_token,
    required this.scope,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
