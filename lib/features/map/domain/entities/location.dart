import 'package:equatable/equatable.dart';

/// 위치 도메인 엔티티
class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String address;
  final DateTime timestamp;
  final double? accuracy;

  const Location({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.timestamp,
    this.accuracy,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        address,
        timestamp,
        accuracy,
      ];

  /// 복사본 생성
  Location copyWith({
    double? latitude,
    double? longitude,
    String? address,
    DateTime? timestamp,
    double? accuracy,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      timestamp: timestamp ?? this.timestamp,
      accuracy: accuracy ?? this.accuracy,
    );
  }

  /// 위치가 유효한지 확인
  bool get isValid {
    return latitude >= -90 &&
        latitude <= 90 &&
        longitude >= -180 &&
        longitude <= 180;
  }
}
