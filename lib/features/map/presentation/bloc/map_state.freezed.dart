// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapState {
// 위치 관련 상태
  bool get hasLocationPermission => throw _privateConstructorUsedError;
  bool get isLoadingLocation => throw _privateConstructorUsedError;
  Location? get currentLocation => throw _privateConstructorUsedError;
  Failure? get locationFailure =>
      throw _privateConstructorUsedError; // 레스토랑 검색 관련 상태
  bool get isLoadingRestaurants => throw _privateConstructorUsedError;
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;
  Failure? get restaurantFailure => throw _privateConstructorUsedError; // 검색 설정
  double get searchRadius => throw _privateConstructorUsedError;
  List<String> get selectedFoodTypes =>
      throw _privateConstructorUsedError; // UI 상태
  bool get isModalOpen => throw _privateConstructorUsedError;
  bool get isMapLoaded => throw _privateConstructorUsedError;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {bool hasLocationPermission,
      bool isLoadingLocation,
      Location? currentLocation,
      Failure? locationFailure,
      bool isLoadingRestaurants,
      List<Restaurant> restaurants,
      Failure? restaurantFailure,
      double searchRadius,
      List<String> selectedFoodTypes,
      bool isModalOpen,
      bool isMapLoaded});
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasLocationPermission = null,
    Object? isLoadingLocation = null,
    Object? currentLocation = freezed,
    Object? locationFailure = freezed,
    Object? isLoadingRestaurants = null,
    Object? restaurants = null,
    Object? restaurantFailure = freezed,
    Object? searchRadius = null,
    Object? selectedFoodTypes = null,
    Object? isModalOpen = null,
    Object? isMapLoaded = null,
  }) {
    return _then(_value.copyWith(
      hasLocationPermission: null == hasLocationPermission
          ? _value.hasLocationPermission
          : hasLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingLocation: null == isLoadingLocation
          ? _value.isLoadingLocation
          : isLoadingLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationFailure: freezed == locationFailure
          ? _value.locationFailure
          : locationFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoadingRestaurants: null == isLoadingRestaurants
          ? _value.isLoadingRestaurants
          : isLoadingRestaurants // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      restaurantFailure: freezed == restaurantFailure
          ? _value.restaurantFailure
          : restaurantFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      searchRadius: null == searchRadius
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as double,
      selectedFoodTypes: null == selectedFoodTypes
          ? _value.selectedFoodTypes
          : selectedFoodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isModalOpen: null == isModalOpen
          ? _value.isModalOpen
          : isModalOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isMapLoaded: null == isMapLoaded
          ? _value.isMapLoaded
          : isMapLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasLocationPermission,
      bool isLoadingLocation,
      Location? currentLocation,
      Failure? locationFailure,
      bool isLoadingRestaurants,
      List<Restaurant> restaurants,
      Failure? restaurantFailure,
      double searchRadius,
      List<String> selectedFoodTypes,
      bool isModalOpen,
      bool isMapLoaded});
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasLocationPermission = null,
    Object? isLoadingLocation = null,
    Object? currentLocation = freezed,
    Object? locationFailure = freezed,
    Object? isLoadingRestaurants = null,
    Object? restaurants = null,
    Object? restaurantFailure = freezed,
    Object? searchRadius = null,
    Object? selectedFoodTypes = null,
    Object? isModalOpen = null,
    Object? isMapLoaded = null,
  }) {
    return _then(_$MapStateImpl(
      hasLocationPermission: null == hasLocationPermission
          ? _value.hasLocationPermission
          : hasLocationPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingLocation: null == isLoadingLocation
          ? _value.isLoadingLocation
          : isLoadingLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationFailure: freezed == locationFailure
          ? _value.locationFailure
          : locationFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isLoadingRestaurants: null == isLoadingRestaurants
          ? _value.isLoadingRestaurants
          : isLoadingRestaurants // ignore: cast_nullable_to_non_nullable
              as bool,
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      restaurantFailure: freezed == restaurantFailure
          ? _value.restaurantFailure
          : restaurantFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      searchRadius: null == searchRadius
          ? _value.searchRadius
          : searchRadius // ignore: cast_nullable_to_non_nullable
              as double,
      selectedFoodTypes: null == selectedFoodTypes
          ? _value._selectedFoodTypes
          : selectedFoodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isModalOpen: null == isModalOpen
          ? _value.isModalOpen
          : isModalOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isMapLoaded: null == isMapLoaded
          ? _value.isMapLoaded
          : isMapLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MapStateImpl implements _MapState {
  const _$MapStateImpl(
      {this.hasLocationPermission = false,
      this.isLoadingLocation = false,
      this.currentLocation,
      this.locationFailure,
      this.isLoadingRestaurants = false,
      final List<Restaurant> restaurants = const [],
      this.restaurantFailure,
      this.searchRadius = 1.0,
      final List<String> selectedFoodTypes = const [],
      this.isModalOpen = false,
      this.isMapLoaded = false})
      : _restaurants = restaurants,
        _selectedFoodTypes = selectedFoodTypes;

// 위치 관련 상태
  @override
  @JsonKey()
  final bool hasLocationPermission;
  @override
  @JsonKey()
  final bool isLoadingLocation;
  @override
  final Location? currentLocation;
  @override
  final Failure? locationFailure;
// 레스토랑 검색 관련 상태
  @override
  @JsonKey()
  final bool isLoadingRestaurants;
  final List<Restaurant> _restaurants;
  @override
  @JsonKey()
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  final Failure? restaurantFailure;
// 검색 설정
  @override
  @JsonKey()
  final double searchRadius;
  final List<String> _selectedFoodTypes;
  @override
  @JsonKey()
  List<String> get selectedFoodTypes {
    if (_selectedFoodTypes is EqualUnmodifiableListView)
      return _selectedFoodTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFoodTypes);
  }

// UI 상태
  @override
  @JsonKey()
  final bool isModalOpen;
  @override
  @JsonKey()
  final bool isMapLoaded;

  @override
  String toString() {
    return 'MapState(hasLocationPermission: $hasLocationPermission, isLoadingLocation: $isLoadingLocation, currentLocation: $currentLocation, locationFailure: $locationFailure, isLoadingRestaurants: $isLoadingRestaurants, restaurants: $restaurants, restaurantFailure: $restaurantFailure, searchRadius: $searchRadius, selectedFoodTypes: $selectedFoodTypes, isModalOpen: $isModalOpen, isMapLoaded: $isMapLoaded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            (identical(other.hasLocationPermission, hasLocationPermission) ||
                other.hasLocationPermission == hasLocationPermission) &&
            (identical(other.isLoadingLocation, isLoadingLocation) ||
                other.isLoadingLocation == isLoadingLocation) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.locationFailure, locationFailure) ||
                other.locationFailure == locationFailure) &&
            (identical(other.isLoadingRestaurants, isLoadingRestaurants) ||
                other.isLoadingRestaurants == isLoadingRestaurants) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            (identical(other.restaurantFailure, restaurantFailure) ||
                other.restaurantFailure == restaurantFailure) &&
            (identical(other.searchRadius, searchRadius) ||
                other.searchRadius == searchRadius) &&
            const DeepCollectionEquality()
                .equals(other._selectedFoodTypes, _selectedFoodTypes) &&
            (identical(other.isModalOpen, isModalOpen) ||
                other.isModalOpen == isModalOpen) &&
            (identical(other.isMapLoaded, isMapLoaded) ||
                other.isMapLoaded == isMapLoaded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasLocationPermission,
      isLoadingLocation,
      currentLocation,
      locationFailure,
      isLoadingRestaurants,
      const DeepCollectionEquality().hash(_restaurants),
      restaurantFailure,
      searchRadius,
      const DeepCollectionEquality().hash(_selectedFoodTypes),
      isModalOpen,
      isMapLoaded);

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final bool hasLocationPermission,
      final bool isLoadingLocation,
      final Location? currentLocation,
      final Failure? locationFailure,
      final bool isLoadingRestaurants,
      final List<Restaurant> restaurants,
      final Failure? restaurantFailure,
      final double searchRadius,
      final List<String> selectedFoodTypes,
      final bool isModalOpen,
      final bool isMapLoaded}) = _$MapStateImpl;

// 위치 관련 상태
  @override
  bool get hasLocationPermission;
  @override
  bool get isLoadingLocation;
  @override
  Location? get currentLocation;
  @override
  Failure? get locationFailure; // 레스토랑 검색 관련 상태
  @override
  bool get isLoadingRestaurants;
  @override
  List<Restaurant> get restaurants;
  @override
  Failure? get restaurantFailure; // 검색 설정
  @override
  double get searchRadius;
  @override
  List<String> get selectedFoodTypes; // UI 상태
  @override
  bool get isModalOpen;
  @override
  bool get isMapLoaded;

  /// Create a copy of MapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
