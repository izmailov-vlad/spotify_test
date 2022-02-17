import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sporify/core/data/entities/new_releases.dart';
import 'package:sporify/core/data/network/account.dart';
import 'package:sporify/core/data/network/client.dart';
import 'package:sporify/injection/injection.dart';

class Interceptor {
  static String client_id = "dc72f20c6d6142728aa2072fdb33b105";
  static String client_secret = "5012eb60ee284d4bb63eb553262af578";

  static String AuthorizationStr = "$client_id:$client_secret";
  static var bytes = utf8.encode(AuthorizationStr);
  static var base64Str = base64.encode(bytes);

  String Authorization = 'Basic ' + base64Str;

  var urlToToken = Uri.parse('https://accounts.spotify.com/api/token');

  var urlToAuthorize = Uri.parse('https://accounts.spotify.com/authorize');
  Future configureNetwork() async {
    final accountDio = Dio(); // Provide a dio instance
    final spotifyDio = Dio();
    accountDio.options.headers["Authorization"] = Authorization;
    accountDio.options.headers["Content-Type"] =
        'application/x-www-form-urlencoded';

    final accountClient = AccountClient(accountDio);

    final config = await accountClient.getToken(
      {
        "client_id": client_id,
        "client_secret": client_secret,
        "grant_type": 'client_credentials'
      },
    );

    log('access token: ' + config.access_token);

    spotifyDio.options.headers["Authorization"] =
        'Bearer ${config.access_token}';

    final spotifyClient = SpotifyClient(spotifyDio);

    final newReleases = await spotifyClient.getNewReleases();

    log('NewReleases: ' + newReleases.toString());

    getIt.registerLazySingleton<SpotifyClient>(
      () => spotifyClient,
    );

    getIt.registerLazySingleton<AccountClient>(
      () => accountClient,
    );
  }
}
