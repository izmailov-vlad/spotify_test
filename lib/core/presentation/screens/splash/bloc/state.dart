import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/entities/albums.dart';
import 'package:sporify/core/data/entities/new_releases.dart';

class SplashState {
  final NewReleases? newReleases;
  SplashState({
    this.newReleases,
  });

  SplashState copyWith({
    NewReleases? newReleases,
  }) {
    return SplashState(
      newReleases: newReleases ?? this.newReleases,
    );
  }
}
