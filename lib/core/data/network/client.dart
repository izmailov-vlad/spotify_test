import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/new_releases.dart';
import 'package:sporify/core/data/entities/tracks.dart';
import 'package:sporify/resources/url_path.dart';

part 'client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class SpotifyClient {
  factory SpotifyClient(Dio dio, {String baseUrl}) = _SpotifyClient;

  @GET(UrlPath.newReleases)
  Future<NewReleases> getNewReleases();

  @GET(UrlPath.getAlbum)
  Future<Album?> getAlbum(@Path() String id);


  @GET(UrlPath.severalTracks)
  Future<Tracks?> getSeveralTracks(@Query('ids') String ids);
}
