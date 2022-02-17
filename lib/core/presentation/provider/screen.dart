import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporify/core/data/storage/database.dart';
import 'package:sporify/core/presentation/router/bloc/bloc.dart';
import 'package:sporify/core/presentation/router/router.dart';
import 'package:sporify/core/presentation/screens/album/album.dart';
import 'package:sporify/core/presentation/screens/album/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/favourites/favourites.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/splash/splash.dart';
import 'package:sporify/injection/injection.dart';

class ScreenProvider {
  static RouteInfo splash() => RouteInfo(
        id: SplashScreen.id,
        builder: (_) => BlocProvider<SplashBloc>(
          create: (_) => getIt<SplashBloc>(),
          child: const SplashScreen(),
        ),
      );
      static RouteInfo album({required String id}) => RouteInfo(
        id: AlbumScreen.id,
        builder: (_) => BlocProvider<AlbumBloc>(
          create: (_) => getIt<AlbumBloc>(param1: id),
          child: const AlbumScreen(),
        ),
      );
      static RouteInfo favourites() => RouteInfo(
        id: FavouritesScreen.id,
        builder: (_) => BlocProvider<FavouritesBloc>(
          create: (_) => getIt<FavouritesBloc>(),
          child: const FavouritesScreen(),
        ),
      );
}

class RouteInfo {
  RouteInfo({
    required this.id,
    this.type = PageType.screen,
    required this.builder,
  });

  final String id;
  final WidgetBuilder builder;
  PageType type;

  @override
  String toString() {
    return 'Route{id: $id, builder: $builder}';
  }
}
