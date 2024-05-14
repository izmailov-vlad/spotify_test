import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporify/core/data/entities/album.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/bloc.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/event.dart';
import 'package:sporify/core/presentation/screens/splash/bloc/state.dart';

class SplashScreen extends StatelessWidget {
  static const id = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  List<Widget> buildCarouselItems(List<Album> items, Function onTap) {
    return items
        .map(
          (item) => GestureDetector(
            onTap: () => onTap(item.id),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Image.network(
                item.images.first.url,
                height: 500,
                width: 500,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(),
            child: Text(
              'New releases',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              if (state.newReleases != null) {
                return CarouselSlider(
                  items: buildCarouselItems(state.newReleases!.albums.items,
                      (String id) {
                    context.read<SplashBloc>().add(
                          SplashEvent.openAlbum(id),
                        );
                  }),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          // TextButton(
          //   onPressed: () {
          //     context.read<SplashBloc>().add(
          //           SplashEvent.routeToFavourite(),
          //         );
          //   },
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(
          //         20,
          //       ),
          //     ),
          //     child: Container(
          //       color: Colors.blue.withOpacity(0.8),
          //       height: 50,
          //       width: MediaQuery.of(context).size.width,
          //       child: Center(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(
          //               Icons.favorite,
          //               color: Colors.white,
          //             ),
          //             SizedBox(
          //               width: 10,
          //             ),
          //             Text(
          //               'Избранное',
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
