// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FavouritesEventTearOff {
  const _$FavouritesEventTearOff();

  UpdateFavuritesList updateFavouritesList(Set<String> favouritesIds) {
    return UpdateFavuritesList(
      favouritesIds,
    );
  }

  Pop pop() {
    return const Pop();
  }
}

/// @nodoc
const $FavouritesEvent = _$FavouritesEventTearOff();

/// @nodoc
mixin _$FavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String> favouritesIds) updateFavouritesList,
    required TResult Function() pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateFavuritesList value) updateFavouritesList,
    required TResult Function(Pop value) pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

  final FavouritesEvent _value;
  // ignore: unused_field
  final $Res Function(FavouritesEvent) _then;
}

/// @nodoc
abstract class $UpdateFavuritesListCopyWith<$Res> {
  factory $UpdateFavuritesListCopyWith(
          UpdateFavuritesList value, $Res Function(UpdateFavuritesList) then) =
      _$UpdateFavuritesListCopyWithImpl<$Res>;
  $Res call({Set<String> favouritesIds});
}

/// @nodoc
class _$UpdateFavuritesListCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res>
    implements $UpdateFavuritesListCopyWith<$Res> {
  _$UpdateFavuritesListCopyWithImpl(
      UpdateFavuritesList _value, $Res Function(UpdateFavuritesList) _then)
      : super(_value, (v) => _then(v as UpdateFavuritesList));

  @override
  UpdateFavuritesList get _value => super._value as UpdateFavuritesList;

  @override
  $Res call({
    Object? favouritesIds = freezed,
  }) {
    return _then(UpdateFavuritesList(
      favouritesIds == freezed
          ? _value.favouritesIds
          : favouritesIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$UpdateFavuritesList implements UpdateFavuritesList {
  const _$UpdateFavuritesList(this.favouritesIds);

  @override
  final Set<String> favouritesIds;

  @override
  String toString() {
    return 'FavouritesEvent.updateFavouritesList(favouritesIds: $favouritesIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateFavuritesList &&
            const DeepCollectionEquality()
                .equals(other.favouritesIds, favouritesIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(favouritesIds));

  @JsonKey(ignore: true)
  @override
  $UpdateFavuritesListCopyWith<UpdateFavuritesList> get copyWith =>
      _$UpdateFavuritesListCopyWithImpl<UpdateFavuritesList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String> favouritesIds) updateFavouritesList,
    required TResult Function() pop,
  }) {
    return updateFavouritesList(favouritesIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
  }) {
    return updateFavouritesList?.call(favouritesIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
    required TResult orElse(),
  }) {
    if (updateFavouritesList != null) {
      return updateFavouritesList(favouritesIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateFavuritesList value) updateFavouritesList,
    required TResult Function(Pop value) pop,
  }) {
    return updateFavouritesList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
  }) {
    return updateFavouritesList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (updateFavouritesList != null) {
      return updateFavouritesList(this);
    }
    return orElse();
  }
}

abstract class UpdateFavuritesList implements FavouritesEvent {
  const factory UpdateFavuritesList(Set<String> favouritesIds) =
      _$UpdateFavuritesList;

  Set<String> get favouritesIds;
  @JsonKey(ignore: true)
  $UpdateFavuritesListCopyWith<UpdateFavuritesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopCopyWith<$Res> {
  factory $PopCopyWith(Pop value, $Res Function(Pop) then) =
      _$PopCopyWithImpl<$Res>;
}

/// @nodoc
class _$PopCopyWithImpl<$Res> extends _$FavouritesEventCopyWithImpl<$Res>
    implements $PopCopyWith<$Res> {
  _$PopCopyWithImpl(Pop _value, $Res Function(Pop) _then)
      : super(_value, (v) => _then(v as Pop));

  @override
  Pop get _value => super._value as Pop;
}

/// @nodoc

class _$Pop implements Pop {
  const _$Pop();

  @override
  String toString() {
    return 'FavouritesEvent.pop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Pop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String> favouritesIds) updateFavouritesList,
    required TResult Function() pop,
  }) {
    return pop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
  }) {
    return pop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String> favouritesIds)? updateFavouritesList,
    TResult Function()? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateFavuritesList value) updateFavouritesList,
    required TResult Function(Pop value) pop,
  }) {
    return pop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
  }) {
    return pop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateFavuritesList value)? updateFavouritesList,
    TResult Function(Pop value)? pop,
    required TResult orElse(),
  }) {
    if (pop != null) {
      return pop(this);
    }
    return orElse();
  }
}

abstract class Pop implements FavouritesEvent {
  const factory Pop() = _$Pop;
}
