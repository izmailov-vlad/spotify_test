import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sporify/core/data/storage/database.dart';

abstract class FavouritesRepository {
  addToFavuorite(String id);
  deleteFromFavourite(String id);
  Stream<Set<String>?> getFavourites();
}

@Singleton(as: FavouritesRepository)
class FavouritesRepositoryImpl extends FavouritesRepository {
  final DatabaseStorage databaseStorage;

  final _favouritesTracks = BehaviorSubject<Set<String>?>();
  Stream<Set<String>?> get favouritesTracks => _favouritesTracks.stream;

  FavouritesRepositoryImpl({
    required this.databaseStorage,
  });
  @override
  addToFavuorite(String id) {
    var favourites = databaseStorage.favourites;
    if (favourites == null) favourites = Favourites([]);
    favourites.favouriteIds.add(id);
    _favouritesTracks.add(
      favourites.favouriteIds.toSet(),
    );
    databaseStorage.favourites = favourites;
  }

  @override
  Stream<Set<String>?> getFavourites() {
    final favourites = databaseStorage.favourites;

    _favouritesTracks.add(favourites?.favouriteIds.toSet());
    return favouritesTracks;
  }

  @override
  deleteFromFavourite(String id) {
    var favourites = databaseStorage.favourites;
    if (favourites == null) return;
    favourites.favouriteIds.remove(id);
    _favouritesTracks.add(
      favourites.favouriteIds.toSet(),
    );
    databaseStorage.favourites = favourites;
  }
}
