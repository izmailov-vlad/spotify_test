import 'package:injectable/injectable.dart';

import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/repository/albums.dart';
import 'package:sporify/utils/result.dart';

abstract class GetAlbumUseCase {
  Future<Result<Album>> call({required String id});
}

@Injectable(as: GetAlbumUseCase)
class GetAlbumUseCaseImpl extends GetAlbumUseCase {
  final AlbumsRepository albumsRepository;
  GetAlbumUseCaseImpl({
    required this.albumsRepository,
  });
  @override
  Future<Result<Album>> call({required String id}) {
    final album = albumsRepository.getAlbum(id: id);
    return album;
  }
}
