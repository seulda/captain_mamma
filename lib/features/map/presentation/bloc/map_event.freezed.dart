// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapEventCopyWith<$Res> {
  factory $MapEventCopyWith(MapEvent value, $Res Function(MapEvent) then) =
      _$MapEventCopyWithImpl<$Res, MapEvent>;
}

/// @nodoc
class _$MapEventCopyWithImpl<$Res, $Val extends MapEvent>
    implements $MapEventCopyWith<$Res> {
  _$MapEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RequestLocationPermissionImplCopyWith<$Res> {
  factory _$$RequestLocationPermissionImplCopyWith(
          _$RequestLocationPermissionImpl value,
          $Res Function(_$RequestLocationPermissionImpl) then) =
      __$$RequestLocationPermissionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestLocationPermissionImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$RequestLocationPermissionImpl>
    implements _$$RequestLocationPermissionImplCopyWith<$Res> {
  __$$RequestLocationPermissionImplCopyWithImpl(
      _$RequestLocationPermissionImpl _value,
      $Res Function(_$RequestLocationPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RequestLocationPermissionImpl implements _RequestLocationPermission {
  const _$RequestLocationPermissionImpl();

  @override
  String toString() {
    return 'MapEvent.requestLocationPermission()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLocationPermissionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return requestLocationPermission();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return requestLocationPermission?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (requestLocationPermission != null) {
      return requestLocationPermission();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return requestLocationPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return requestLocationPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (requestLocationPermission != null) {
      return requestLocationPermission(this);
    }
    return orElse();
  }
}

abstract class _RequestLocationPermission implements MapEvent {
  const factory _RequestLocationPermission() = _$RequestLocationPermissionImpl;
}

/// @nodoc
abstract class _$$GetCurrentLocationImplCopyWith<$Res> {
  factory _$$GetCurrentLocationImplCopyWith(_$GetCurrentLocationImpl value,
          $Res Function(_$GetCurrentLocationImpl) then) =
      __$$GetCurrentLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCurrentLocationImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$GetCurrentLocationImpl>
    implements _$$GetCurrentLocationImplCopyWith<$Res> {
  __$$GetCurrentLocationImplCopyWithImpl(_$GetCurrentLocationImpl _value,
      $Res Function(_$GetCurrentLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCurrentLocationImpl implements _GetCurrentLocation {
  const _$GetCurrentLocationImpl();

  @override
  String toString() {
    return 'MapEvent.getCurrentLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCurrentLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return getCurrentLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return getCurrentLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class _GetCurrentLocation implements MapEvent {
  const factory _GetCurrentLocation() = _$GetCurrentLocationImpl;
}

/// @nodoc
abstract class _$$SetLocationImplCopyWith<$Res> {
  factory _$$SetLocationImplCopyWith(
          _$SetLocationImpl value, $Res Function(_$SetLocationImpl) then) =
      __$$SetLocationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$SetLocationImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SetLocationImpl>
    implements _$$SetLocationImplCopyWith<$Res> {
  __$$SetLocationImplCopyWithImpl(
      _$SetLocationImpl _value, $Res Function(_$SetLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$SetLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SetLocationImpl implements _SetLocation {
  const _$SetLocationImpl({required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'MapEvent.setLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetLocationImplCopyWith<_$SetLocationImpl> get copyWith =>
      __$$SetLocationImplCopyWithImpl<_$SetLocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return setLocation(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return setLocation?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setLocation != null) {
      return setLocation(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return setLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return setLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setLocation != null) {
      return setLocation(this);
    }
    return orElse();
  }
}

abstract class _SetLocation implements MapEvent {
  const factory _SetLocation(
      {required final double latitude,
      required final double longitude}) = _$SetLocationImpl;

  double get latitude;
  double get longitude;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetLocationImplCopyWith<_$SetLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchRestaurantsInBoundsImplCopyWith<$Res> {
  factory _$$SearchRestaurantsInBoundsImplCopyWith(
          _$SearchRestaurantsInBoundsImpl value,
          $Res Function(_$SearchRestaurantsInBoundsImpl) then) =
      __$$SearchRestaurantsInBoundsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLngBounds bounds, double radius, List<String>? types});
}

/// @nodoc
class __$$SearchRestaurantsInBoundsImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SearchRestaurantsInBoundsImpl>
    implements _$$SearchRestaurantsInBoundsImplCopyWith<$Res> {
  __$$SearchRestaurantsInBoundsImplCopyWithImpl(
      _$SearchRestaurantsInBoundsImpl _value,
      $Res Function(_$SearchRestaurantsInBoundsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? radius = null,
    Object? types = freezed,
  }) {
    return _then(_$SearchRestaurantsInBoundsImpl(
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$SearchRestaurantsInBoundsImpl implements _SearchRestaurantsInBounds {
  const _$SearchRestaurantsInBoundsImpl(
      {required this.bounds, required this.radius, final List<String>? types})
      : _types = types;

  @override
  final LatLngBounds bounds;
  @override
  final double radius;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MapEvent.searchRestaurantsInBounds(bounds: $bounds, radius: $radius, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRestaurantsInBoundsImpl &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bounds, radius, const DeepCollectionEquality().hash(_types));

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRestaurantsInBoundsImplCopyWith<_$SearchRestaurantsInBoundsImpl>
      get copyWith => __$$SearchRestaurantsInBoundsImplCopyWithImpl<
          _$SearchRestaurantsInBoundsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return searchRestaurantsInBounds(bounds, radius, types);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return searchRestaurantsInBounds?.call(bounds, radius, types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (searchRestaurantsInBounds != null) {
      return searchRestaurantsInBounds(bounds, radius, types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return searchRestaurantsInBounds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return searchRestaurantsInBounds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (searchRestaurantsInBounds != null) {
      return searchRestaurantsInBounds(this);
    }
    return orElse();
  }
}

abstract class _SearchRestaurantsInBounds implements MapEvent {
  const factory _SearchRestaurantsInBounds(
      {required final LatLngBounds bounds,
      required final double radius,
      final List<String>? types}) = _$SearchRestaurantsInBoundsImpl;

  LatLngBounds get bounds;
  double get radius;
  List<String>? get types;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRestaurantsInBoundsImplCopyWith<_$SearchRestaurantsInBoundsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchNearbyRestaurantsImplCopyWith<$Res> {
  factory _$$SearchNearbyRestaurantsImplCopyWith(
          _$SearchNearbyRestaurantsImpl value,
          $Res Function(_$SearchNearbyRestaurantsImpl) then) =
      __$$SearchNearbyRestaurantsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude, double longitude, double radius, List<String>? types});
}

/// @nodoc
class __$$SearchNearbyRestaurantsImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SearchNearbyRestaurantsImpl>
    implements _$$SearchNearbyRestaurantsImplCopyWith<$Res> {
  __$$SearchNearbyRestaurantsImplCopyWithImpl(
      _$SearchNearbyRestaurantsImpl _value,
      $Res Function(_$SearchNearbyRestaurantsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
    Object? types = freezed,
  }) {
    return _then(_$SearchNearbyRestaurantsImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$SearchNearbyRestaurantsImpl implements _SearchNearbyRestaurants {
  const _$SearchNearbyRestaurantsImpl(
      {required this.latitude,
      required this.longitude,
      required this.radius,
      final List<String>? types})
      : _types = types;

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double radius;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MapEvent.searchNearbyRestaurants(latitude: $latitude, longitude: $longitude, radius: $radius, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchNearbyRestaurantsImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, radius,
      const DeepCollectionEquality().hash(_types));

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchNearbyRestaurantsImplCopyWith<_$SearchNearbyRestaurantsImpl>
      get copyWith => __$$SearchNearbyRestaurantsImplCopyWithImpl<
          _$SearchNearbyRestaurantsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return searchNearbyRestaurants(latitude, longitude, radius, types);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return searchNearbyRestaurants?.call(latitude, longitude, radius, types);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (searchNearbyRestaurants != null) {
      return searchNearbyRestaurants(latitude, longitude, radius, types);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return searchNearbyRestaurants(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return searchNearbyRestaurants?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (searchNearbyRestaurants != null) {
      return searchNearbyRestaurants(this);
    }
    return orElse();
  }
}

abstract class _SearchNearbyRestaurants implements MapEvent {
  const factory _SearchNearbyRestaurants(
      {required final double latitude,
      required final double longitude,
      required final double radius,
      final List<String>? types}) = _$SearchNearbyRestaurantsImpl;

  double get latitude;
  double get longitude;
  double get radius;
  List<String>? get types;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchNearbyRestaurantsImplCopyWith<_$SearchNearbyRestaurantsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRestaurantDetailsImplCopyWith<$Res> {
  factory _$$GetRestaurantDetailsImplCopyWith(_$GetRestaurantDetailsImpl value,
          $Res Function(_$GetRestaurantDetailsImpl) then) =
      __$$GetRestaurantDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String restaurantId});
}

/// @nodoc
class __$$GetRestaurantDetailsImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$GetRestaurantDetailsImpl>
    implements _$$GetRestaurantDetailsImplCopyWith<$Res> {
  __$$GetRestaurantDetailsImplCopyWithImpl(_$GetRestaurantDetailsImpl _value,
      $Res Function(_$GetRestaurantDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
  }) {
    return _then(_$GetRestaurantDetailsImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRestaurantDetailsImpl implements _GetRestaurantDetails {
  const _$GetRestaurantDetailsImpl({required this.restaurantId});

  @override
  final String restaurantId;

  @override
  String toString() {
    return 'MapEvent.getRestaurantDetails(restaurantId: $restaurantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRestaurantDetailsImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, restaurantId);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRestaurantDetailsImplCopyWith<_$GetRestaurantDetailsImpl>
      get copyWith =>
          __$$GetRestaurantDetailsImplCopyWithImpl<_$GetRestaurantDetailsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return getRestaurantDetails(restaurantId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return getRestaurantDetails?.call(restaurantId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (getRestaurantDetails != null) {
      return getRestaurantDetails(restaurantId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return getRestaurantDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return getRestaurantDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (getRestaurantDetails != null) {
      return getRestaurantDetails(this);
    }
    return orElse();
  }
}

abstract class _GetRestaurantDetails implements MapEvent {
  const factory _GetRestaurantDetails({required final String restaurantId}) =
      _$GetRestaurantDetailsImpl;

  String get restaurantId;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRestaurantDetailsImplCopyWith<_$GetRestaurantDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetSearchRadiusImplCopyWith<$Res> {
  factory _$$SetSearchRadiusImplCopyWith(_$SetSearchRadiusImpl value,
          $Res Function(_$SetSearchRadiusImpl) then) =
      __$$SetSearchRadiusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double radius});
}

/// @nodoc
class __$$SetSearchRadiusImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SetSearchRadiusImpl>
    implements _$$SetSearchRadiusImplCopyWith<$Res> {
  __$$SetSearchRadiusImplCopyWithImpl(
      _$SetSearchRadiusImpl _value, $Res Function(_$SetSearchRadiusImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radius = null,
  }) {
    return _then(_$SetSearchRadiusImpl(
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SetSearchRadiusImpl implements _SetSearchRadius {
  const _$SetSearchRadiusImpl({required this.radius});

  @override
  final double radius;

  @override
  String toString() {
    return 'MapEvent.setSearchRadius(radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetSearchRadiusImpl &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radius);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetSearchRadiusImplCopyWith<_$SetSearchRadiusImpl> get copyWith =>
      __$$SetSearchRadiusImplCopyWithImpl<_$SetSearchRadiusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return setSearchRadius(radius);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return setSearchRadius?.call(radius);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setSearchRadius != null) {
      return setSearchRadius(radius);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return setSearchRadius(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return setSearchRadius?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setSearchRadius != null) {
      return setSearchRadius(this);
    }
    return orElse();
  }
}

abstract class _SetSearchRadius implements MapEvent {
  const factory _SetSearchRadius({required final double radius}) =
      _$SetSearchRadiusImpl;

  double get radius;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetSearchRadiusImplCopyWith<_$SetSearchRadiusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFoodTypeImplCopyWith<$Res> {
  factory _$$ToggleFoodTypeImplCopyWith(_$ToggleFoodTypeImpl value,
          $Res Function(_$ToggleFoodTypeImpl) then) =
      __$$ToggleFoodTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String foodType});
}

/// @nodoc
class __$$ToggleFoodTypeImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ToggleFoodTypeImpl>
    implements _$$ToggleFoodTypeImplCopyWith<$Res> {
  __$$ToggleFoodTypeImplCopyWithImpl(
      _$ToggleFoodTypeImpl _value, $Res Function(_$ToggleFoodTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodType = null,
  }) {
    return _then(_$ToggleFoodTypeImpl(
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleFoodTypeImpl implements _ToggleFoodType {
  const _$ToggleFoodTypeImpl({required this.foodType});

  @override
  final String foodType;

  @override
  String toString() {
    return 'MapEvent.toggleFoodType(foodType: $foodType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFoodTypeImpl &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foodType);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFoodTypeImplCopyWith<_$ToggleFoodTypeImpl> get copyWith =>
      __$$ToggleFoodTypeImplCopyWithImpl<_$ToggleFoodTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return toggleFoodType(foodType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return toggleFoodType?.call(foodType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (toggleFoodType != null) {
      return toggleFoodType(foodType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return toggleFoodType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return toggleFoodType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (toggleFoodType != null) {
      return toggleFoodType(this);
    }
    return orElse();
  }
}

abstract class _ToggleFoodType implements MapEvent {
  const factory _ToggleFoodType({required final String foodType}) =
      _$ToggleFoodTypeImpl;

  String get foodType;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFoodTypeImplCopyWith<_$ToggleFoodTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetFiltersImplCopyWith<$Res> {
  factory _$$ResetFiltersImplCopyWith(
          _$ResetFiltersImpl value, $Res Function(_$ResetFiltersImpl) then) =
      __$$ResetFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetFiltersImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ResetFiltersImpl>
    implements _$$ResetFiltersImplCopyWith<$Res> {
  __$$ResetFiltersImplCopyWithImpl(
      _$ResetFiltersImpl _value, $Res Function(_$ResetFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetFiltersImpl implements _ResetFilters {
  const _$ResetFiltersImpl();

  @override
  String toString() {
    return 'MapEvent.resetFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return resetFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return resetFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return resetFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return resetFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters(this);
    }
    return orElse();
  }
}

abstract class _ResetFilters implements MapEvent {
  const factory _ResetFilters() = _$ResetFiltersImpl;
}

/// @nodoc
abstract class _$$SetModalOpenImplCopyWith<$Res> {
  factory _$$SetModalOpenImplCopyWith(
          _$SetModalOpenImpl value, $Res Function(_$SetModalOpenImpl) then) =
      __$$SetModalOpenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isOpen});
}

/// @nodoc
class __$$SetModalOpenImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SetModalOpenImpl>
    implements _$$SetModalOpenImplCopyWith<$Res> {
  __$$SetModalOpenImplCopyWithImpl(
      _$SetModalOpenImpl _value, $Res Function(_$SetModalOpenImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
  }) {
    return _then(_$SetModalOpenImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetModalOpenImpl implements _SetModalOpen {
  const _$SetModalOpenImpl({required this.isOpen});

  @override
  final bool isOpen;

  @override
  String toString() {
    return 'MapEvent.setModalOpen(isOpen: $isOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetModalOpenImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOpen);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetModalOpenImplCopyWith<_$SetModalOpenImpl> get copyWith =>
      __$$SetModalOpenImplCopyWithImpl<_$SetModalOpenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return setModalOpen(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return setModalOpen?.call(isOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setModalOpen != null) {
      return setModalOpen(isOpen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return setModalOpen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return setModalOpen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setModalOpen != null) {
      return setModalOpen(this);
    }
    return orElse();
  }
}

abstract class _SetModalOpen implements MapEvent {
  const factory _SetModalOpen({required final bool isOpen}) =
      _$SetModalOpenImpl;

  bool get isOpen;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetModalOpenImplCopyWith<_$SetModalOpenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetMapLoadedImplCopyWith<$Res> {
  factory _$$SetMapLoadedImplCopyWith(
          _$SetMapLoadedImpl value, $Res Function(_$SetMapLoadedImpl) then) =
      __$$SetMapLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isLoaded});
}

/// @nodoc
class __$$SetMapLoadedImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$SetMapLoadedImpl>
    implements _$$SetMapLoadedImplCopyWith<$Res> {
  __$$SetMapLoadedImplCopyWithImpl(
      _$SetMapLoadedImpl _value, $Res Function(_$SetMapLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoaded = null,
  }) {
    return _then(_$SetMapLoadedImpl(
      isLoaded: null == isLoaded
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetMapLoadedImpl implements _SetMapLoaded {
  const _$SetMapLoadedImpl({required this.isLoaded});

  @override
  final bool isLoaded;

  @override
  String toString() {
    return 'MapEvent.setMapLoaded(isLoaded: $isLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetMapLoadedImpl &&
            (identical(other.isLoaded, isLoaded) ||
                other.isLoaded == isLoaded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoaded);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetMapLoadedImplCopyWith<_$SetMapLoadedImpl> get copyWith =>
      __$$SetMapLoadedImplCopyWithImpl<_$SetMapLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return setMapLoaded(isLoaded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return setMapLoaded?.call(isLoaded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setMapLoaded != null) {
      return setMapLoaded(isLoaded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return setMapLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return setMapLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (setMapLoaded != null) {
      return setMapLoaded(this);
    }
    return orElse();
  }
}

abstract class _SetMapLoaded implements MapEvent {
  const factory _SetMapLoaded({required final bool isLoaded}) =
      _$SetMapLoadedImpl;

  bool get isLoaded;

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetMapLoadedImplCopyWith<_$SetMapLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearLocationErrorImplCopyWith<$Res> {
  factory _$$ClearLocationErrorImplCopyWith(_$ClearLocationErrorImpl value,
          $Res Function(_$ClearLocationErrorImpl) then) =
      __$$ClearLocationErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearLocationErrorImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ClearLocationErrorImpl>
    implements _$$ClearLocationErrorImplCopyWith<$Res> {
  __$$ClearLocationErrorImplCopyWithImpl(_$ClearLocationErrorImpl _value,
      $Res Function(_$ClearLocationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearLocationErrorImpl implements _ClearLocationError {
  const _$ClearLocationErrorImpl();

  @override
  String toString() {
    return 'MapEvent.clearLocationError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearLocationErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return clearLocationError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return clearLocationError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (clearLocationError != null) {
      return clearLocationError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return clearLocationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return clearLocationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (clearLocationError != null) {
      return clearLocationError(this);
    }
    return orElse();
  }
}

abstract class _ClearLocationError implements MapEvent {
  const factory _ClearLocationError() = _$ClearLocationErrorImpl;
}

/// @nodoc
abstract class _$$ClearRestaurantErrorImplCopyWith<$Res> {
  factory _$$ClearRestaurantErrorImplCopyWith(_$ClearRestaurantErrorImpl value,
          $Res Function(_$ClearRestaurantErrorImpl) then) =
      __$$ClearRestaurantErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearRestaurantErrorImplCopyWithImpl<$Res>
    extends _$MapEventCopyWithImpl<$Res, _$ClearRestaurantErrorImpl>
    implements _$$ClearRestaurantErrorImplCopyWith<$Res> {
  __$$ClearRestaurantErrorImplCopyWithImpl(_$ClearRestaurantErrorImpl _value,
      $Res Function(_$ClearRestaurantErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearRestaurantErrorImpl implements _ClearRestaurantError {
  const _$ClearRestaurantErrorImpl();

  @override
  String toString() {
    return 'MapEvent.clearRestaurantError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearRestaurantErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocationPermission,
    required TResult Function() getCurrentLocation,
    required TResult Function(double latitude, double longitude) setLocation,
    required TResult Function(
            LatLngBounds bounds, double radius, List<String>? types)
        searchRestaurantsInBounds,
    required TResult Function(double latitude, double longitude, double radius,
            List<String>? types)
        searchNearbyRestaurants,
    required TResult Function(String restaurantId) getRestaurantDetails,
    required TResult Function(double radius) setSearchRadius,
    required TResult Function(String foodType) toggleFoodType,
    required TResult Function() resetFilters,
    required TResult Function(bool isOpen) setModalOpen,
    required TResult Function(bool isLoaded) setMapLoaded,
    required TResult Function() clearLocationError,
    required TResult Function() clearRestaurantError,
  }) {
    return clearRestaurantError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocationPermission,
    TResult? Function()? getCurrentLocation,
    TResult? Function(double latitude, double longitude)? setLocation,
    TResult? Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult? Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult? Function(String restaurantId)? getRestaurantDetails,
    TResult? Function(double radius)? setSearchRadius,
    TResult? Function(String foodType)? toggleFoodType,
    TResult? Function()? resetFilters,
    TResult? Function(bool isOpen)? setModalOpen,
    TResult? Function(bool isLoaded)? setMapLoaded,
    TResult? Function()? clearLocationError,
    TResult? Function()? clearRestaurantError,
  }) {
    return clearRestaurantError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocationPermission,
    TResult Function()? getCurrentLocation,
    TResult Function(double latitude, double longitude)? setLocation,
    TResult Function(LatLngBounds bounds, double radius, List<String>? types)?
        searchRestaurantsInBounds,
    TResult Function(double latitude, double longitude, double radius,
            List<String>? types)?
        searchNearbyRestaurants,
    TResult Function(String restaurantId)? getRestaurantDetails,
    TResult Function(double radius)? setSearchRadius,
    TResult Function(String foodType)? toggleFoodType,
    TResult Function()? resetFilters,
    TResult Function(bool isOpen)? setModalOpen,
    TResult Function(bool isLoaded)? setMapLoaded,
    TResult Function()? clearLocationError,
    TResult Function()? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (clearRestaurantError != null) {
      return clearRestaurantError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocationPermission value)
        requestLocationPermission,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_SetLocation value) setLocation,
    required TResult Function(_SearchRestaurantsInBounds value)
        searchRestaurantsInBounds,
    required TResult Function(_SearchNearbyRestaurants value)
        searchNearbyRestaurants,
    required TResult Function(_GetRestaurantDetails value) getRestaurantDetails,
    required TResult Function(_SetSearchRadius value) setSearchRadius,
    required TResult Function(_ToggleFoodType value) toggleFoodType,
    required TResult Function(_ResetFilters value) resetFilters,
    required TResult Function(_SetModalOpen value) setModalOpen,
    required TResult Function(_SetMapLoaded value) setMapLoaded,
    required TResult Function(_ClearLocationError value) clearLocationError,
    required TResult Function(_ClearRestaurantError value) clearRestaurantError,
  }) {
    return clearRestaurantError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_SetLocation value)? setLocation,
    TResult? Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult? Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult? Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult? Function(_SetSearchRadius value)? setSearchRadius,
    TResult? Function(_ToggleFoodType value)? toggleFoodType,
    TResult? Function(_ResetFilters value)? resetFilters,
    TResult? Function(_SetModalOpen value)? setModalOpen,
    TResult? Function(_SetMapLoaded value)? setMapLoaded,
    TResult? Function(_ClearLocationError value)? clearLocationError,
    TResult? Function(_ClearRestaurantError value)? clearRestaurantError,
  }) {
    return clearRestaurantError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocationPermission value)?
        requestLocationPermission,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_SetLocation value)? setLocation,
    TResult Function(_SearchRestaurantsInBounds value)?
        searchRestaurantsInBounds,
    TResult Function(_SearchNearbyRestaurants value)? searchNearbyRestaurants,
    TResult Function(_GetRestaurantDetails value)? getRestaurantDetails,
    TResult Function(_SetSearchRadius value)? setSearchRadius,
    TResult Function(_ToggleFoodType value)? toggleFoodType,
    TResult Function(_ResetFilters value)? resetFilters,
    TResult Function(_SetModalOpen value)? setModalOpen,
    TResult Function(_SetMapLoaded value)? setMapLoaded,
    TResult Function(_ClearLocationError value)? clearLocationError,
    TResult Function(_ClearRestaurantError value)? clearRestaurantError,
    required TResult orElse(),
  }) {
    if (clearRestaurantError != null) {
      return clearRestaurantError(this);
    }
    return orElse();
  }
}

abstract class _ClearRestaurantError implements MapEvent {
  const factory _ClearRestaurantError() = _$ClearRestaurantErrorImpl;
}
