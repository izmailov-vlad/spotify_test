import 'package:injectable/injectable.dart';

import 'package:sporify/core/data/repository/favourites.dart';

abstract class RemoveFromFavouriteUseCase {
  call(String id);
}

@Injectable(as: RemoveFromFavouriteUseCase)
class RemoveFromFavouriteUseCaseImpl extends RemoveFromFavouriteUseCase {
  final FavouritesRepository favouritesRepository;
  RemoveFromFavouriteUseCaseImpl({
    required this.favouritesRepository,
  });
  @override
  call(String id) {
    favouritesRepository.deleteFromFavourite(id);
  }

}
