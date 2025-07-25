// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantModelImpl(
      id: json['place_id'] as String,
      name: json['name'] as String,
      address: json['formatted_address'] as String,
      geometry:
          GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      phoneNumber: json['formatted_phone_number'] as String?,
      website: json['website'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      priceLevel: (json['price_level'] as num?)?.toInt(),
      openingHours: json['opening_hours'] == null
          ? null
          : OpeningHoursModel.fromJson(
              json['opening_hours'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RestaurantModelImplToJson(
        _$RestaurantModelImpl instance) =>
    <String, dynamic>{
      'place_id': instance.id,
      'name': instance.name,
      'formatted_address': instance.address,
      'geometry': instance.geometry,
      'rating': instance.rating,
      'formatted_phone_number': instance.phoneNumber,
      'website': instance.website,
      'types': instance.types,
      'price_level': instance.priceLevel,
      'opening_hours': instance.openingHours,
      'photos': instance.photos,
    };

_$GeometryModelImpl _$$GeometryModelImplFromJson(Map<String, dynamic> json) =>
    _$GeometryModelImpl(
      location: LocationCoordinateModel.fromJson(
          json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryModelImplToJson(_$GeometryModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_$LocationCoordinateModelImpl _$$LocationCoordinateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationCoordinateModelImpl(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationCoordinateModelImplToJson(
        _$LocationCoordinateModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'lng': instance.longitude,
    };

_$OpeningHoursModelImpl _$$OpeningHoursModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OpeningHoursModelImpl(
      openNow: json['open_now'] as bool? ?? false,
      weekdayText: (json['weekday_text'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OpeningHoursModelImplToJson(
        _$OpeningHoursModelImpl instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'weekday_text': instance.weekdayText,
    };

_$PhotoModelImpl _$$PhotoModelImplFromJson(Map<String, dynamic> json) =>
    _$PhotoModelImpl(
      photoReference: json['photo_reference'] as String,
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$$PhotoModelImplToJson(_$PhotoModelImpl instance) =>
    <String, dynamic>{
      'photo_reference': instance.photoReference,
      'height': instance.height,
      'width': instance.width,
    };
