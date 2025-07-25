import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/restaurant.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

/// 레스토랑 데이터 모델 (DTO)
@Freezed(toJson: true, fromJson: true)
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required String id,
    required String name,
    required String address,
    required GeometryModel geometry,
    double? rating,
    String? phoneNumber,
    String? website,
    @Default([]) List<String> types,
    int? priceLevel,
    OpeningHoursModel? openingHours,
    @Default([]) List<PhotoModel> photos,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}

/// Google Places API의 geometry 구조
@freezed
class GeometryModel with _$GeometryModel {
  const factory GeometryModel({
    required LocationCoordinateModel location,
  }) = _GeometryModel;

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);
}

/// 위도/경도 좌표
@freezed
class LocationCoordinateModel with _$LocationCoordinateModel {
  const factory LocationCoordinateModel({
    required double latitude,
    required double longitude,
  }) = _LocationCoordinateModel;

  factory LocationCoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$LocationCoordinateModelFromJson(json);
}

/// 영업시간 정보
@freezed
class OpeningHoursModel with _$OpeningHoursModel {
  const factory OpeningHoursModel({
    @Default(false) bool openNow,
    @Default([]) List<String> weekdayText,
  }) = _OpeningHoursModel;

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursModelFromJson(json);
}

/// 사진 정보
@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required String photoReference,
    required int height,
    required int width,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}

/// RestaurantModel을 Domain Entity로 변환하는 확장
extension RestaurantModelX on RestaurantModel {
  Restaurant toDomain() {
    return Restaurant(
      id: id,
      name: name,
      address: address,
      latitude: geometry.location.latitude,
      longitude: geometry.location.longitude,
      rating: rating,
      phoneNumber: phoneNumber,
      website: website,
      types: types,
      priceLevel: priceLevel,
      isOpen: openingHours?.openNow ?? false,
      openingHours: openingHours?.weekdayText.join('\n'),
      photoReference: photos.isNotEmpty ? photos.first.photoReference : null,
    );
  }
}
