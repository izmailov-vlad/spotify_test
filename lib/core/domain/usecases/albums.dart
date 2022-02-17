import 'package:injectable/injectable.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/albums.dart';
import 'package:sporify/core/data/entities/new_releases.dart';

import 'package:sporify/core/data/repository/albums.dart';

abstract class GetAlbumsUseCase {
  Future<NewReleases> call();
}

@Injectable(as: GetAlbumsUseCase)
class GetAlbumsUseCaseImpl extends GetAlbumsUseCase {
  final AlbumsRepository songsRepository;
  GetAlbumsUseCaseImpl({
    required this.songsRepository,
  });
  @override
  Future<NewReleases> call() async {
    return songsRepository.getNewReleases();
  }
}
