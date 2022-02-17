import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';

@freezed
class AlbumEvent with _$AlbumEvent {
  const factory AlbumEvent.getAlbum() = GetAlbum;
  const factory AlbumEvent.addToFavourite(String id) = AddToFavourite;
  const factory AlbumEvent.removeFromFavourite(String id) = RemoveFromFavourite;
  const factory AlbumEvent.pop() = Pop;
}
