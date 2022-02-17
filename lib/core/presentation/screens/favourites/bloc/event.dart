import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';

@freezed
class FavouritesEvent with _$FavouritesEvent {
  const factory FavouritesEvent.updateFavouritesList(
      Set<String> favouritesIds) = UpdateFavuritesList;
  const factory FavouritesEvent.pop() = Pop;
}
