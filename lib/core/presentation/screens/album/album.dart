import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporify/core/data/entities/track.dart';
import 'package:sporify/core/presentation/screens/album/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/album/bloc/event.dart';
import 'package:sporify/core/presentation/screens/album/bloc/state.dart';
import 'package:sporify/core/presentation/screens/album/widgets/header.dart';
import 'package:sporify/core/presentation/widgets/appbar.dart';

class AlbumScreen extends StatelessWidget {
  static const id = '/album';
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _inFavourite(String id) => GestureDetector(
          onTap: () {
            context.read<AlbumBloc>().add(
                  AlbumEvent.removeFromFavourite(id),
                );
          },
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        );
    Widget _notFavourite(String id) => GestureDetector(
          onTap: () {
            context.read<AlbumBloc>().add(
                  AlbumEvent.addToFavourite(id),
                );
          },
          child: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
        );

    bool _checkFavourite(Track track, Set<String> ids) {
      return ids.contains(track.id);
    }

    return Scaffold(
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state.albumStatus == AlbumStatus.loaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SpotifyAppBar(
                    body: GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 10),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        context.read<AlbumBloc>().add(
                              AlbumEvent.pop(),
                            );
                      },
                    ),
                    preferedSize: Size.fromHeight(70),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverPersistentHeader(
                  delegate: AlbumImage(
                    photoUrl: state.album!.images.first.url,
                    maxSize: MediaQuery.of(context).size.height * 0.4,
                    minSize: 0,
                  ),
                  pinned: false,
                  floating: false,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.tracks[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  _checkFavourite(state.tracks[index],
                                          state.favouritesIds)
                                      ? _inFavourite(state.tracks[index].id)
                                      : _notFavourite(state.tracks[index].id),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: state.tracks.length,
                  ),
                )
              ],
            );
          }

          if (state.albumStatus == AlbumStatus.error) {
            Center(
              child: Text(
                'Ошибка получения данных',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
