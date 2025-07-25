// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  @JsonKey(name: 'place_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'geometry')
  GeometryModel get geometry => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'website')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'types')
  List<String> get types => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_level')
  int? get priceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  OpeningHoursModel? get openingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos')
  List<PhotoModel> get photos => throw _privateConstructorUsedError;

  /// Serializes this RestaurantModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
          RestaurantModel value, $Res Function(RestaurantModel) then) =
      _$RestaurantModelCopyWithImpl<$Res, RestaurantModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String id,
      String name,
      @JsonKey(name: 'formatted_address') String address,
      @JsonKey(name: 'geometry') GeometryModel geometry,
      @JsonKey(name: 'rating') double? rating,
      @JsonKey(name: 'formatted_phone_number') String? phoneNumber,
      @JsonKey(name: 'website') String? website,
      @JsonKey(name: 'types') List<String> types,
      @JsonKey(name: 'price_level') int? priceLevel,
      @JsonKey(name: 'opening_hours') OpeningHoursModel? openingHours,
      @JsonKey(name: 'photos') List<PhotoModel> photos});

  $GeometryModelCopyWith<$Res> get geometry;
  $OpeningHoursModelCopyWith<$Res>? get openingHours;
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res, $Val extends RestaurantModel>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? geometry = null,
    Object? rating = freezed,
    Object? phoneNumber = freezed,
    Object? website = freezed,
    Object? types = null,
    Object? priceLevel = freezed,
    Object? openingHours = freezed,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeometryModel,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHoursModel?,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
    ) as $Val);
  }

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeometryModelCopyWith<$Res> get geometry {
    return $GeometryModelCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpeningHoursModelCopyWith<$Res>? get openingHours {
    if (_value.openingHours == null) {
      return null;
    }

    return $OpeningHoursModelCopyWith<$Res>(_value.openingHours!, (value) {
      return _then(_value.copyWith(openingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantModelImplCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$RestaurantModelImplCopyWith(_$RestaurantModelImpl value,
          $Res Function(_$RestaurantModelImpl) then) =
      __$$RestaurantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String id,
      String name,
      @JsonKey(name: 'formatted_address') String address,
      @JsonKey(name: 'geometry') GeometryModel geometry,
      @JsonKey(name: 'rating') double? rating,
      @JsonKey(name: 'formatted_phone_number') String? phoneNumber,
      @JsonKey(name: 'website') String? website,
      @JsonKey(name: 'types') List<String> types,
      @JsonKey(name: 'price_level') int? priceLevel,
      @JsonKey(name: 'opening_hours') OpeningHoursModel? openingHours,
      @JsonKey(name: 'photos') List<PhotoModel> photos});

  @override
  $GeometryModelCopyWith<$Res> get geometry;
  @override
  $OpeningHoursModelCopyWith<$Res>? get openingHours;
}

/// @nodoc
class __$$RestaurantModelImplCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res, _$RestaurantModelImpl>
    implements _$$RestaurantModelImplCopyWith<$Res> {
  __$$RestaurantModelImplCopyWithImpl(
      _$RestaurantModelImpl _value, $Res Function(_$RestaurantModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? geometry = null,
    Object? rating = freezed,
    Object? phoneNumber = freezed,
    Object? website = freezed,
    Object? types = null,
    Object? priceLevel = freezed,
    Object? openingHours = freezed,
    Object? photos = null,
  }) {
    return _then(_$RestaurantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeometryModel,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceLevel: freezed == priceLevel
          ? _value.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      openingHours: freezed == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as OpeningHoursModel?,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantModelImpl implements _RestaurantModel {
  const _$RestaurantModelImpl(
      {@JsonKey(name: 'place_id') required this.id,
      required this.name,
      @JsonKey(name: 'formatted_address') required this.address,
      @JsonKey(name: 'geometry') required this.geometry,
      @JsonKey(name: 'rating') this.rating,
      @JsonKey(name: 'formatted_phone_number') this.phoneNumber,
      @JsonKey(name: 'website') this.website,
      @JsonKey(name: 'types') final List<String> types = const [],
      @JsonKey(name: 'price_level') this.priceLevel,
      @JsonKey(name: 'opening_hours') this.openingHours,
      @JsonKey(name: 'photos') final List<PhotoModel> photos = const []})
      : _types = types,
        _photos = photos;

  factory _$RestaurantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantModelImplFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'formatted_address')
  final String address;
  @override
  @JsonKey(name: 'geometry')
  final GeometryModel geometry;
  @override
  @JsonKey(name: 'rating')
  final double? rating;
  @override
  @JsonKey(name: 'formatted_phone_number')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'website')
  final String? website;
  final List<String> _types;
  @override
  @JsonKey(name: 'types')
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  @JsonKey(name: 'price_level')
  final int? priceLevel;
  @override
  @JsonKey(name: 'opening_hours')
  final OpeningHoursModel? openingHours;
  final List<PhotoModel> _photos;
  @override
  @JsonKey(name: 'photos')
  List<PhotoModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, address: $address, geometry: $geometry, rating: $rating, phoneNumber: $phoneNumber, website: $website, types: $types, priceLevel: $priceLevel, openingHours: $openingHours, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      geometry,
      rating,
      phoneNumber,
      website,
      const DeepCollectionEquality().hash(_types),
      priceLevel,
      openingHours,
      const DeepCollectionEquality().hash(_photos));

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      __$$RestaurantModelImplCopyWithImpl<_$RestaurantModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  const factory _RestaurantModel(
          {@JsonKey(name: 'place_id') required final String id,
          required final String name,
          @JsonKey(name: 'formatted_address') required final String address,
          @JsonKey(name: 'geometry') required final GeometryModel geometry,
          @JsonKey(name: 'rating') final double? rating,
          @JsonKey(name: 'formatted_phone_number') final String? phoneNumber,
          @JsonKey(name: 'website') final String? website,
          @JsonKey(name: 'types') final List<String> types,
          @JsonKey(name: 'price_level') final int? priceLevel,
          @JsonKey(name: 'opening_hours') final OpeningHoursModel? openingHours,
          @JsonKey(name: 'photos') final List<PhotoModel> photos}) =
      _$RestaurantModelImpl;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantModelImpl.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'formatted_address')
  String get address;
  @override
  @JsonKey(name: 'geometry')
  GeometryModel get geometry;
  @override
  @JsonKey(name: 'rating')
  double? get rating;
  @override
  @JsonKey(name: 'formatted_phone_number')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'website')
  String? get website;
  @override
  @JsonKey(name: 'types')
  List<String> get types;
  @override
  @JsonKey(name: 'price_level')
  int? get priceLevel;
  @override
  @JsonKey(name: 'opening_hours')
  OpeningHoursModel? get openingHours;
  @override
  @JsonKey(name: 'photos')
  List<PhotoModel> get photos;

  /// Create a copy of RestaurantModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeometryModel _$GeometryModelFromJson(Map<String, dynamic> json) {
  return _GeometryModel.fromJson(json);
}

/// @nodoc
mixin _$GeometryModel {
  LocationCoordinateModel get location => throw _privateConstructorUsedError;

  /// Serializes this GeometryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeometryModelCopyWith<GeometryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryModelCopyWith<$Res> {
  factory $GeometryModelCopyWith(
          GeometryModel value, $Res Function(GeometryModel) then) =
      _$GeometryModelCopyWithImpl<$Res, GeometryModel>;
  @useResult
  $Res call({LocationCoordinateModel location});

  $LocationCoordinateModelCopyWith<$Res> get location;
}

/// @nodoc
class _$GeometryModelCopyWithImpl<$Res, $Val extends GeometryModel>
    implements $GeometryModelCopyWith<$Res> {
  _$GeometryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationCoordinateModel,
    ) as $Val);
  }

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCoordinateModelCopyWith<$Res> get location {
    return $LocationCoordinateModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeometryModelImplCopyWith<$Res>
    implements $GeometryModelCopyWith<$Res> {
  factory _$$GeometryModelImplCopyWith(
          _$GeometryModelImpl value, $Res Function(_$GeometryModelImpl) then) =
      __$$GeometryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocationCoordinateModel location});

  @override
  $LocationCoordinateModelCopyWith<$Res> get location;
}

/// @nodoc
class __$$GeometryModelImplCopyWithImpl<$Res>
    extends _$GeometryModelCopyWithImpl<$Res, _$GeometryModelImpl>
    implements _$$GeometryModelImplCopyWith<$Res> {
  __$$GeometryModelImplCopyWithImpl(
      _$GeometryModelImpl _value, $Res Function(_$GeometryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_$GeometryModelImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationCoordinateModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeometryModelImpl implements _GeometryModel {
  const _$GeometryModelImpl({required this.location});

  factory _$GeometryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeometryModelImplFromJson(json);

  @override
  final LocationCoordinateModel location;

  @override
  String toString() {
    return 'GeometryModel(location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeometryModelImpl &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location);

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeometryModelImplCopyWith<_$GeometryModelImpl> get copyWith =>
      __$$GeometryModelImplCopyWithImpl<_$GeometryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeometryModelImplToJson(
      this,
    );
  }
}

abstract class _GeometryModel implements GeometryModel {
  const factory _GeometryModel(
      {required final LocationCoordinateModel location}) = _$GeometryModelImpl;

  factory _GeometryModel.fromJson(Map<String, dynamic> json) =
      _$GeometryModelImpl.fromJson;

  @override
  LocationCoordinateModel get location;

  /// Create a copy of GeometryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeometryModelImplCopyWith<_$GeometryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationCoordinateModel _$LocationCoordinateModelFromJson(
    Map<String, dynamic> json) {
  return _LocationCoordinateModel.fromJson(json);
}

/// @nodoc
mixin _$LocationCoordinateModel {
  @JsonKey(name: 'lat')
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'lng')
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationCoordinateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationCoordinateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCoordinateModelCopyWith<LocationCoordinateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCoordinateModelCopyWith<$Res> {
  factory $LocationCoordinateModelCopyWith(LocationCoordinateModel value,
          $Res Function(LocationCoordinateModel) then) =
      _$LocationCoordinateModelCopyWithImpl<$Res, LocationCoordinateModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double latitude,
      @JsonKey(name: 'lng') double longitude});
}

/// @nodoc
class _$LocationCoordinateModelCopyWithImpl<$Res,
        $Val extends LocationCoordinateModel>
    implements $LocationCoordinateModelCopyWith<$Res> {
  _$LocationCoordinateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationCoordinateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationCoordinateModelImplCopyWith<$Res>
    implements $LocationCoordinateModelCopyWith<$Res> {
  factory _$$LocationCoordinateModelImplCopyWith(
          _$LocationCoordinateModelImpl value,
          $Res Function(_$LocationCoordinateModelImpl) then) =
      __$$LocationCoordinateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lat') double latitude,
      @JsonKey(name: 'lng') double longitude});
}

/// @nodoc
class __$$LocationCoordinateModelImplCopyWithImpl<$Res>
    extends _$LocationCoordinateModelCopyWithImpl<$Res,
        _$LocationCoordinateModelImpl>
    implements _$$LocationCoordinateModelImplCopyWith<$Res> {
  __$$LocationCoordinateModelImplCopyWithImpl(
      _$LocationCoordinateModelImpl _value,
      $Res Function(_$LocationCoordinateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationCoordinateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationCoordinateModelImpl(
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
@JsonSerializable()
class _$LocationCoordinateModelImpl implements _LocationCoordinateModel {
  const _$LocationCoordinateModelImpl(
      {@JsonKey(name: 'lat') required this.latitude,
      @JsonKey(name: 'lng') required this.longitude});

  factory _$LocationCoordinateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationCoordinateModelImplFromJson(json);

  @override
  @JsonKey(name: 'lat')
  final double latitude;
  @override
  @JsonKey(name: 'lng')
  final double longitude;

  @override
  String toString() {
    return 'LocationCoordinateModel(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationCoordinateModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of LocationCoordinateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationCoordinateModelImplCopyWith<_$LocationCoordinateModelImpl>
      get copyWith => __$$LocationCoordinateModelImplCopyWithImpl<
          _$LocationCoordinateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationCoordinateModelImplToJson(
      this,
    );
  }
}

abstract class _LocationCoordinateModel implements LocationCoordinateModel {
  const factory _LocationCoordinateModel(
          {@JsonKey(name: 'lat') required final double latitude,
          @JsonKey(name: 'lng') required final double longitude}) =
      _$LocationCoordinateModelImpl;

  factory _LocationCoordinateModel.fromJson(Map<String, dynamic> json) =
      _$LocationCoordinateModelImpl.fromJson;

  @override
  @JsonKey(name: 'lat')
  double get latitude;
  @override
  @JsonKey(name: 'lng')
  double get longitude;

  /// Create a copy of LocationCoordinateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationCoordinateModelImplCopyWith<_$LocationCoordinateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OpeningHoursModel _$OpeningHoursModelFromJson(Map<String, dynamic> json) {
  return _OpeningHoursModel.fromJson(json);
}

/// @nodoc
mixin _$OpeningHoursModel {
  @JsonKey(name: 'open_now')
  bool get openNow => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText => throw _privateConstructorUsedError;

  /// Serializes this OpeningHoursModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpeningHoursModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpeningHoursModelCopyWith<OpeningHoursModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningHoursModelCopyWith<$Res> {
  factory $OpeningHoursModelCopyWith(
          OpeningHoursModel value, $Res Function(OpeningHoursModel) then) =
      _$OpeningHoursModelCopyWithImpl<$Res, OpeningHoursModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'open_now') bool openNow,
      @JsonKey(name: 'weekday_text') List<String> weekdayText});
}

/// @nodoc
class _$OpeningHoursModelCopyWithImpl<$Res, $Val extends OpeningHoursModel>
    implements $OpeningHoursModelCopyWith<$Res> {
  _$OpeningHoursModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpeningHoursModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? weekdayText = null,
  }) {
    return _then(_value.copyWith(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      weekdayText: null == weekdayText
          ? _value.weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpeningHoursModelImplCopyWith<$Res>
    implements $OpeningHoursModelCopyWith<$Res> {
  factory _$$OpeningHoursModelImplCopyWith(_$OpeningHoursModelImpl value,
          $Res Function(_$OpeningHoursModelImpl) then) =
      __$$OpeningHoursModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'open_now') bool openNow,
      @JsonKey(name: 'weekday_text') List<String> weekdayText});
}

/// @nodoc
class __$$OpeningHoursModelImplCopyWithImpl<$Res>
    extends _$OpeningHoursModelCopyWithImpl<$Res, _$OpeningHoursModelImpl>
    implements _$$OpeningHoursModelImplCopyWith<$Res> {
  __$$OpeningHoursModelImplCopyWithImpl(_$OpeningHoursModelImpl _value,
      $Res Function(_$OpeningHoursModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpeningHoursModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? weekdayText = null,
  }) {
    return _then(_$OpeningHoursModelImpl(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      weekdayText: null == weekdayText
          ? _value._weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningHoursModelImpl implements _OpeningHoursModel {
  const _$OpeningHoursModelImpl(
      {@JsonKey(name: 'open_now') this.openNow = false,
      @JsonKey(name: 'weekday_text') final List<String> weekdayText = const []})
      : _weekdayText = weekdayText;

  factory _$OpeningHoursModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningHoursModelImplFromJson(json);

  @override
  @JsonKey(name: 'open_now')
  final bool openNow;
  final List<String> _weekdayText;
  @override
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText {
    if (_weekdayText is EqualUnmodifiableListView) return _weekdayText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdayText);
  }

  @override
  String toString() {
    return 'OpeningHoursModel(openNow: $openNow, weekdayText: $weekdayText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningHoursModelImpl &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality()
                .equals(other._weekdayText, _weekdayText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, openNow, const DeepCollectionEquality().hash(_weekdayText));

  /// Create a copy of OpeningHoursModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningHoursModelImplCopyWith<_$OpeningHoursModelImpl> get copyWith =>
      __$$OpeningHoursModelImplCopyWithImpl<_$OpeningHoursModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningHoursModelImplToJson(
      this,
    );
  }
}

abstract class _OpeningHoursModel implements OpeningHoursModel {
  const factory _OpeningHoursModel(
          {@JsonKey(name: 'open_now') final bool openNow,
          @JsonKey(name: 'weekday_text') final List<String> weekdayText}) =
      _$OpeningHoursModelImpl;

  factory _OpeningHoursModel.fromJson(Map<String, dynamic> json) =
      _$OpeningHoursModelImpl.fromJson;

  @override
  @JsonKey(name: 'open_now')
  bool get openNow;
  @override
  @JsonKey(name: 'weekday_text')
  List<String> get weekdayText;

  /// Create a copy of OpeningHoursModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpeningHoursModelImplCopyWith<_$OpeningHoursModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return _PhotoModel.fromJson(json);
}

/// @nodoc
mixin _$PhotoModel {
  @JsonKey(name: 'photo_reference')
  String get photoReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int get width => throw _privateConstructorUsedError;

  /// Serializes this PhotoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_reference') String photoReference,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'width') int width});
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoReference = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      photoReference: null == photoReference
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoModelImplCopyWith<$Res>
    implements $PhotoModelCopyWith<$Res> {
  factory _$$PhotoModelImplCopyWith(
          _$PhotoModelImpl value, $Res Function(_$PhotoModelImpl) then) =
      __$$PhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'photo_reference') String photoReference,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'width') int width});
}

/// @nodoc
class __$$PhotoModelImplCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$PhotoModelImpl>
    implements _$$PhotoModelImplCopyWith<$Res> {
  __$$PhotoModelImplCopyWithImpl(
      _$PhotoModelImpl _value, $Res Function(_$PhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoReference = null,
    Object? height = null,
    Object? width = null,
  }) {
    return _then(_$PhotoModelImpl(
      photoReference: null == photoReference
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoModelImpl implements _PhotoModel {
  const _$PhotoModelImpl(
      {@JsonKey(name: 'photo_reference') required this.photoReference,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'width') required this.width});

  factory _$PhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoModelImplFromJson(json);

  @override
  @JsonKey(name: 'photo_reference')
  final String photoReference;
  @override
  @JsonKey(name: 'height')
  final int height;
  @override
  @JsonKey(name: 'width')
  final int width;

  @override
  String toString() {
    return 'PhotoModel(photoReference: $photoReference, height: $height, width: $width)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoModelImpl &&
            (identical(other.photoReference, photoReference) ||
                other.photoReference == photoReference) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, photoReference, height, width);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      __$$PhotoModelImplCopyWithImpl<_$PhotoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoModelImplToJson(
      this,
    );
  }
}

abstract class _PhotoModel implements PhotoModel {
  const factory _PhotoModel(
      {@JsonKey(name: 'photo_reference') required final String photoReference,
      @JsonKey(name: 'height') required final int height,
      @JsonKey(name: 'width') required final int width}) = _$PhotoModelImpl;

  factory _PhotoModel.fromJson(Map<String, dynamic> json) =
      _$PhotoModelImpl.fromJson;

  @override
  @JsonKey(name: 'photo_reference')
  String get photoReference;
  @override
  @JsonKey(name: 'height')
  int get height;
  @override
  @JsonKey(name: 'width')
  int get width;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
