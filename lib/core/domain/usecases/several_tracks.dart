import 'package:injectable/injectable.dart';
import 'package:sporify/core/data/entities/track.dart';
import 'package:sporify/core/data/entities/tracks.dart';

import 'package:sporify/core/data/repository/track.dart';
import 'package:sporify/utils/result.dart';

abstract class GetSeveralTracksUseCase {
  Future<Result<Tracks>> call(String ids);
}

@Injectable(as: GetSeveralTracksUseCase)
class GetSeveralTracksUseCaseImpl extends GetSeveralTracksUseCase {
  final TracksRepository tracksRepository;
  GetSeveralTracksUseCaseImpl({
    required this.tracksRepository,
  });
  @override
  Future<Result<Tracks>> call(String ids) async {
    final tracks = tracksRepository.getTracks(ids);
    return tracks;
  }
}
