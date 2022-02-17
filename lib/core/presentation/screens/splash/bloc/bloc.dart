import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:sporify/core/domain/usecases/albums.dart';
import 'package:sporify/core/domain/usecases/get_album.dart';
import 'package:sporify/core/domain/usecases/several_tracks.dart';
import 'package:sporify/core/presentation/router/bloc/bloc.dart';
import 'package:sporify/core/presentation/router/bloc/event.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/state.dart';

import 'event.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetAlbumsUseCase _getAlbumsUseCase;
  final GetAlbumUseCase _getAlbumUseCase;

  final RouterEventSink _routerEventSink;

  SplashBloc(
    this._routerEventSink,
    this._getAlbumsUseCase,
    this._getAlbumUseCase,
  ) : super(
          SplashState(),
        ) {
    add(
      const SplashEvent.getNewReleases(),
    );
  }

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) => event.when(
        routeToFavourite: _routeToFavourite,
        getNewReleases: _getNewReleases,
        openAlbum: _openAlbum,
      );

  Stream<SplashState> _routeToFavourite() async* {
    _routerEventSink.add(RouterEvent.toFavourites());
  }

  Stream<SplashState> _getNewReleases() async* {
    final newReleases = await _getAlbumsUseCase();

    yield state.copyWith(
      newReleases: newReleases,
    );
  }

  Stream<SplashState> _openAlbum(String id) async* {
    _routerEventSink.add(RouterEvent.toAlbum(id));
  }
}
