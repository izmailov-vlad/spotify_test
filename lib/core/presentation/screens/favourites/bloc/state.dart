import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/albums.dart';
import 'package:sporify/core/data/entities/new_releases.dart';
import 'package:sporify/core/data/entities/track.dart';
import 'package:sporify/core/data/entities/tracks.dart';

class FavouritesState {
  final Tracks? favouriteTracks;
  final DataStatus dataStatus;
  FavouritesState({
    this.dataStatus = DataStatus.loading,
    this.favouriteTracks,
  });

  FavouritesState copyWith({
    Tracks? favouriteTracks,
    DataStatus? dataStatus,
  }) {
    return FavouritesState(
      dataStatus: dataStatus ?? this.dataStatus,
      favouriteTracks: favouriteTracks ?? this.favouriteTracks,
    );
  }
}

enum DataStatus {
  loaded,
  empty,
  error,
  loading,
}
