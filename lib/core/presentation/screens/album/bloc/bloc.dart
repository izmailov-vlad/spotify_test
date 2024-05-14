
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sporify/core/data/entities/track.dart';
import 'package:sporify/core/domain/usecases/add_to_favourite.dart';
import 'package:sporify/core/domain/usecases/get_album.dart';
import 'package:sporify/core/domain/usecases/get_favourites.dart';
import 'package:sporify/core/domain/usecases/remove_from_favourite.dart';
import 'package:sporify/core/presentation/router/bloc/bloc.dart';
import 'package:sporify/core/presentation/router/bloc/event.dart';
import 'package:sporify/core/presentation/screens/album/bloc/state.dart';

import 'event.dart';

@Injectable()
class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbumUseCase _getAlbumUseCase;
  final RouterEventSink _routerEventSink;
  final AddSongToFavouriteUseCase _addSongToFavouriteUseCase;
  final RemoveFromFavouriteUseCase _removeFromFavouriteUseCase;
  final GetFavouritesUseCase _getFavouritesUseCase;

  List<Track> tracks = [];
  Set<String> _favourites = {};
  String albumName = 'Album';

  String id;
  AlbumBloc(
    @factoryParam this.id,
    this._removeFromFavouriteUseCase,
    this._getFavouritesUseCase,
    this._addSongToFavouriteUseCase,
    this._getAlbumUseCase,
    this._routerEventSink,
  ) : super(
          AlbumState(),
        ) {
    _getFavouritesUseCase().listen(
      (favourites) {
        if (favourites == null) return;
        _favourites = favourites;
      },
    );
    add(AlbumEvent.getAlbum());
  }

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) => event.when(
        removeFromFavourite: _removeFromFavourite,
        addToFavourite: _addToFavourite,
        getAlbum: _getAlbum,
        pop: _pop,
      );
  Stream<AlbumState> _addToFavourite(String id) async* {
    _favourites.add(id);
    _addSongToFavouriteUseCase(id);
    yield state.copyWith(
      favouritesIds: _favourites,
    );
  }

  Stream<AlbumState> _removeFromFavourite(String id) async* {
    _favourites.remove(id);
    _removeFromFavouriteUseCase(id);
    yield state.copyWith(
      favouritesIds: _favourites,
    );
  }

  Stream<AlbumState> _pop() async* {
    _routerEventSink.add(RouterEvent.pop());
  }

  Stream<AlbumState> _getAlbum() async* {
    final album = await _getAlbumUseCase(id: id);

    if (album.isFailure || album.value == null) {
      yield state.copyWith(
        albumStatus: AlbumStatus.error,
      );
    }

    if (album.value!.tracks != null) tracks = album.value!.tracks!.items!;

    yield state.copyWith(
        album: album.value,
        tracks: tracks,
        albumStatus: AlbumStatus.loaded,
        favouritesIds: _favourites);
  }
}
