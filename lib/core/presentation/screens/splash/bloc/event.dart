import 'package:freezed_annotation/freezed_annotation.dart';
part 'event.freezed.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.getNewReleases() = GetNewReleases;
  const factory SplashEvent.openAlbum(String id) = OpenAlbum;
  const factory SplashEvent.routeToFavourite() = RouteToFavourite;
}
