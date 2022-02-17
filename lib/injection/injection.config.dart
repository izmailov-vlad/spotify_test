// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/network/client.dart' as _i4;
import '../core/data/repository/albums.dart' as _i3;
import '../core/data/repository/favourites.dart' as _i6;
import '../core/data/repository/track.dart' as _i13;
import '../core/data/storage/database.dart' as _i5;
import '../core/domain/usecases/add_to_favourite.dart' as _i14;
import '../core/domain/usecases/albums.dart' as _i8;
import '../core/domain/usecases/get_album.dart' as _i7;
import '../core/domain/usecases/get_favourites.dart' as _i9;
import '../core/domain/usecases/remove_from_favourite.dart' as _i10;
import '../core/domain/usecases/several_tracks.dart' as _i16;
import '../core/presentation/router/bloc/bloc.dart' as _i11;
import '../core/presentation/screens/album/bloc/bloc.dart' as _i15;
import '../core/presentation/screens/favourites/bloc/bloc.dart' as _i17;
import '../core/presentation/screens/splash/bloc/bloc.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AlbumsRepository>(
      () => _i3.AlbumsRepositoryImpl(get<_i4.SpotifyClient>()));
  gh.factory<_i5.DatabaseStorage>(() => _i5.DatabaseStorageHive());
  gh.singleton<_i6.FavouritesRepository>(_i6.FavouritesRepositoryImpl(
      databaseStorage: get<_i5.DatabaseStorage>()));
  gh.factory<_i7.GetAlbumUseCase>(() =>
      _i7.GetAlbumUseCaseImpl(albumsRepository: get<_i3.AlbumsRepository>()));
  gh.factory<_i8.GetAlbumsUseCase>(() =>
      _i8.GetAlbumsUseCaseImpl(songsRepository: get<_i3.AlbumsRepository>()));
  gh.factory<_i9.GetFavouritesUseCase>(() => _i9.GetFavouritesUseCaseImpl(
      favouritesRepository: get<_i6.FavouritesRepository>()));
  gh.factory<_i10.RemoveFromFavouriteUseCase>(() =>
      _i10.RemoveFromFavouriteUseCaseImpl(
          favouritesRepository: get<_i6.FavouritesRepository>()));
  gh.singleton<_i11.RouterEventSink>(_i11.RouterBloc());
  gh.factory<_i12.SplashBloc>(() => _i12.SplashBloc(get<_i11.RouterEventSink>(),
      get<_i8.GetAlbumsUseCase>(), get<_i7.GetAlbumUseCase>()));
  gh.factory<_i13.TracksRepository>(
      () => _i13.TracksRepositoryImpl(client: get<_i4.SpotifyClient>()));
  gh.factory<_i14.AddSongToFavouriteUseCase>(() =>
      _i14.AddSongToFavouriteUseCaseImpl(
          favouritesRepository: get<_i6.FavouritesRepository>()));
  gh.factoryParam<_i15.AlbumBloc, String, dynamic>((id, _) => _i15.AlbumBloc(
      id,
      get<_i10.RemoveFromFavouriteUseCase>(),
      get<_i9.GetFavouritesUseCase>(),
      get<_i14.AddSongToFavouriteUseCase>(),
      get<_i7.GetAlbumUseCase>(),
      get<_i11.RouterEventSink>()));
  gh.factory<_i16.GetSeveralTracksUseCase>(() =>
      _i16.GetSeveralTracksUseCaseImpl(
          tracksRepository: get<_i13.TracksRepository>()));
  gh.factory<_i17.FavouritesBloc>(() => _i17.FavouritesBloc(
      get<_i11.RouterEventSink>(),
      get<_i8.GetAlbumsUseCase>(),
      get<_i16.GetSeveralTracksUseCase>(),
      get<_i7.GetAlbumUseCase>(),
      get<_i9.GetFavouritesUseCase>()));
  return get;
}
