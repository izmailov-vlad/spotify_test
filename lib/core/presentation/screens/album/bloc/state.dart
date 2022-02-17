import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/albums.dart';
import 'package:sporify/core/data/entities/new_releases.dart';
import 'package:sporify/core/data/entities/track.dart';

class AlbumState {
  final Album? album;
  final AlbumStatus albumStatus;
  final List<Track> tracks;
  final Set<String> favouritesIds;
  AlbumState({
    this.album,
    this.tracks = const [],
    this.favouritesIds = const {},
    this.albumStatus = AlbumStatus.loading,
  });

  AlbumState copyWith({
    Album? album,
    Set<String>? favouritesIds,
    List<Track>? tracks,
    AlbumStatus? albumStatus,
  }) {
    return AlbumState(
      favouritesIds: favouritesIds ?? this.favouritesIds,
      albumStatus: albumStatus ?? this.albumStatus,
      album: album ?? this.album,
      tracks: tracks ?? this.tracks,
    );
  }
}

enum AlbumStatus {
  loaded,
  loading,
  error,
}
