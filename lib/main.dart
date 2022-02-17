import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:sporify/core/data/storage/database.dart';
import 'package:sporify/core/presentation/screens/album/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/bloc.dart';
import 'package:sporify/injection/interceptor.dart';

import 'core/presentation/router/bloc/bloc.dart';
import 'core/presentation/router/router.dart';
import 'core/presentation/screens/splash/bloc/bloc.dart';
import 'injection/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavouritesAdapter());
  await Future.wait([DatabaseStorageHive.init()]);
  await configureInjection(Env.dev);
  await Interceptor().configureNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ru', 'RU'),
      ],
      home: BlocProvider<RouterBloc>(
        create: (_) => getIt<RouterEventSink>() as RouterBloc,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SplashBloc>(
              create: (_) => getIt<SplashBloc>(),
            ),

            BlocProvider<FavouritesBloc>(
              create: (_) => getIt<FavouritesBloc>(),
            ),
            BlocProvider<AlbumBloc>(
              create: (_) => getIt<AlbumBloc>(),
            ),
            // сюда добавлять блоки основных (верхних) экранов приложения
          ],
          child: Router(
            routerDelegate: AppRouterDelegate(),
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      ),
    );
  }
}
