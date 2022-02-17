import 'package:injectable/injectable.dart';

import 'package:sporify/core/data/repository/favourites.dart';

abstract class AddSongToFavouriteUseCase {
  call(String id);
}

@Injectable(as: AddSongToFavouriteUseCase)
class AddSongToFavouriteUseCaseImpl extends AddSongToFavouriteUseCase {
  final FavouritesRepository favouritesRepository;
  AddSongToFavouriteUseCaseImpl({
    required this.favouritesRepository,
  });
  @override
  call(String id) {
    favouritesRepository.addToFavuorite(id);
  }

}
