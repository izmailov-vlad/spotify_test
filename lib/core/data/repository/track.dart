import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'package:sporify/core/data/entities/track.dart';
import 'package:sporify/core/data/entities/tracks.dart';
import 'package:sporify/core/data/network/client.dart';
import 'package:sporify/resources/url_path.dart';
import 'package:sporify/utils/result.dart';

abstract class TracksRepository {
  Future<Result<Tracks>> getTracks(String ids);
}

@Injectable(as: TracksRepository)
class TracksRepositoryImpl extends TracksRepository {
  SpotifyClient client;
  TracksRepositoryImpl({
    required this.client,
  });
  @override
  Future<Result<Tracks>> getTracks(String ids) async {
    final tracks = await client.getSeveralTracks(ids);

    if (tracks == null) return Result.success(null);
    return Result.success(tracks);
  }
}
