import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:sporify/core/domain/usecases/albums.dart';
import 'package:sporify/core/domain/usecases/get_album.dart';
import 'package:sporify/core/domain/usecases/get_favourites.dart';
import 'package:sporify/core/domain/usecases/several_tracks.dart';
import 'package:sporify/core/presentation/router/bloc/bloc.dart';
import 'package:sporify/core/presentation/router/bloc/event.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/state.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/state.dart';

import 'event.dart';

@Injectable()
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final GetAlbumsUseCase _getAlbumsUseCase;
  final GetAlbumUseCase _getAlbumUseCase;

  final RouterEventSink _routerEventSink;
  final GetFavouritesUseCase _getFavouritesUseCase;
  final GetSeveralTracksUseCase _getSeveralTracksUse;

  FavouritesBloc(
    this._routerEventSink,
    this._getAlbumsUseCase,
    this._getSeveralTracksUse,
    this._getAlbumUseCase,
    this._getFavouritesUseCase,
  ) : super(
          FavouritesState(),
        ) {
    
    _getFavouritesUseCase().listen(
      (favourites) {
        if (favourites == null) return;
        add(
          FavouritesEvent.updateFavouritesList(favourites),
        );
      },
    );
  }

  @override
  Stream<FavouritesState> mapEventToState(FavouritesEvent event) => event.when(
        updateFavouritesList: _updateFavouritesList,
        pop: _pop,
      );
  Stream<FavouritesState> _pop() async* {
    _routerEventSink.add(
      RouterEvent.pop(),
    );
  }

  Stream<FavouritesState> _updateFavouritesList(Set<String> ids) async* {
    final formattedIds = ids.join(',');
    log('formattedIds: $formattedIds');
    final favouriteTracks = await _getSeveralTracksUse(formattedIds);

    if (favouriteTracks.isFailure) {
      yield state.copyWith(dataStatus: DataStatus.error);
      return;
    }
    if (favouriteTracks.value == null) {
      log('favouriteTracks: null');
      yield state.copyWith(dataStatus: DataStatus.empty);
      return;
    }

    if (favouriteTracks.value!.items == null) {
      log('favouriteTracks: empty');
      yield state.copyWith(dataStatus: DataStatus.empty);
      return;
    }

    yield state.copyWith(
      favouriteTracks: favouriteTracks.value,
      dataStatus: DataStatus.loaded,
    );
  }
}
