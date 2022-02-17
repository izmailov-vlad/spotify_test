import 'package:injectable/injectable.dart';

import 'package:sporify/core/data/repository/favourites.dart';

abstract class GetFavouritesUseCase {
  Stream<Set<String>?> call();
}

@Injectable(as: GetFavouritesUseCase)
class GetFavouritesUseCaseImpl extends GetFavouritesUseCase {
  final FavouritesRepository favouritesRepository;
  GetFavouritesUseCaseImpl({
    required this.favouritesRepository,
  });
  @override
  Stream<Set<String>?> call() {
    return favouritesRepository.getFavourites();
  }
}
