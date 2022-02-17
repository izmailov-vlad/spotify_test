import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/data/storage/database.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/event.dart';
import 'package:sporify/core/presentation/screens/favourites/bloc/state.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/event.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/state.dart';
import 'package:sporify/core/presentation/widgets/appbar.dart';

class FavouritesScreen extends StatelessWidget {
  static const id = '/favourites';
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotifyAppBar(
        body: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5, left: 10),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onTap: () {
            context.read<FavouritesBloc>().add(
                  FavouritesEvent.pop(),
                );
          },
        ),
        preferedSize: Size.fromHeight(70),
      ),
      body: Container(child: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state.dataStatus == DataStatus.loaded) {
            return Center(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    state.favouriteTracks!.items![index].name,
                  );
                },
                itemCount: state.favouriteTracks!.items!.length,
              ),
            );
          }
          if (state.dataStatus == DataStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.dataStatus == DataStatus.empty) {
            return Center(
              child: Text('Список пуст'),
            );
          }

          return Center(
            child: Text(
              'Ошибка получения данных',
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
          );
        },
      )),
    );
  }
}
