import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/albums.dart';
import 'package:sporify/core/data/entities/new_releases.dart';
import 'package:sporify/core/data/network/client.dart';

import 'package:sporify/resources/url_path.dart';
import 'package:sporify/utils/result.dart';

abstract class AlbumsRepository {
  Future<NewReleases> getNewReleases();
  Future<Result<Album>> getAlbum({required String id});
}

@Injectable(as: AlbumsRepository)
class AlbumsRepositoryImpl extends AlbumsRepository {
  SpotifyClient client;
  AlbumsRepositoryImpl(
    this.client,
  );
  @override
  Future<NewReleases> getNewReleases() async {
    var response = await client.getNewReleases();

    return response;
  }

  @override
  Future<Result<Album>> getAlbum({required String id}) async {
    var response = await client.getAlbum(id);

    if (response != null) return Result.success(response);
    return Result.success(
      null,
    );
  }
}
