import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/location.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

/// 위치 데이터 모델 (DTO)
@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required double latitude,
    required double longitude,
    required String address,
    required DateTime timestamp,
    double? accuracy,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

/// LocationModel을 Domain Entity로 변환하는 확장
extension LocationModelX on LocationModel {
  Location toDomain() {
    return Location(
      latitude: latitude,
      longitude: longitude,
      address: address,
      timestamp: timestamp,
      accuracy: accuracy,
    );
  }
}

/// Domain Entity를 LocationModel로 변환하는 확장
extension LocationX on Location {
  LocationModel toModel() {
    return LocationModel(
      latitude: latitude,
      longitude: longitude,
      address: address,
      timestamp: timestamp,
      accuracy: accuracy,
    );
  }
}
