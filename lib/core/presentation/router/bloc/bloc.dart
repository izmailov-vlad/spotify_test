import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sporify/core/presentation/provider/screen.dart';
import 'package:sporify/core/presentation/router/bloc/event.dart';

typedef RouteEventHandler = Stream<List<RouteInfo>>;

abstract class RouterEventSink {
  void add(RouterEvent event);
}

@Singleton(as: RouterEventSink)
class RouterBloc extends Bloc<RouterEvent, List<RouteInfo>>
    implements RouterEventSink {
  RouterBloc() : super([ScreenProvider.splash()]);

  @override
  Stream<List<RouteInfo>> mapEventToState(RouterEvent event) => event.when(
        pop: _onPop,
        toFavourites: _toFavourites,
        toSplash: _toSplashScreen,
        toAlbum: _toAlbumScreen,
      );

  RouteEventHandler _toFavourites() async* {
    yield [...state, ScreenProvider.favourites()];
  }

  RouteEventHandler _toAlbumScreen(String id) async* {
    yield [...state, ScreenProvider.album(id: id)];
  }

  RouteEventHandler _toSplashScreen() async* {
    yield [...state, ScreenProvider.splash()];
  }

  RouteEventHandler _onPop() async* {
    yield [...state..removeLast()];
  }
}

enum RouterToHome {
  toMenu,
  toBucket,
}
