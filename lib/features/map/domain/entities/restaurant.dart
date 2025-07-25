import 'dart:math';
import 'package:equatable/equatable.dart';

/// 레스토랑 도메인 엔티티
class Restaurant extends Equatable {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double? rating;
  final String? phoneNumber;
  final String? website;
  final List<String> types;
  final int? priceLevel;
  final bool isOpen;
  final String? openingHours;
  final String? photoReference;

  const Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.rating,
    this.phoneNumber,
    this.website,
    this.types = const [],
    this.priceLevel,
    this.isOpen = false,
    this.openingHours,
    this.photoReference,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        latitude,
        longitude,
        rating,
        phoneNumber,
        website,
        types,
        priceLevel,
        isOpen,
        openingHours,
        photoReference,
      ];

  /// 거리 계산을 위한 메서드
  double distanceTo(double lat, double lng) {
    // Haversine formula 구현
    const double earthRadius = 6371; // km
    final double dLat = _toRadians(lat - latitude);
    final double dLng = _toRadians(lng - longitude);

    final double a = (sin(dLat / 2) * sin(dLat / 2)) +
        (cos(_toRadians(latitude)) *
            cos(_toRadians(lat)) *
            sin(dLng / 2) *
            sin(dLng / 2));
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) => degree * pi / 180;

  /// 복사본 생성
  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    double? latitude,
    double? longitude,
    double? rating,
    String? phoneNumber,
    String? website,
    List<String>? types,
    int? priceLevel,
    bool? isOpen,
    String? openingHours,
    String? photoReference,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      types: types ?? this.types,
      priceLevel: priceLevel ?? this.priceLevel,
      isOpen: isOpen ?? this.isOpen,
      openingHours: openingHours ?? this.openingHours,
      photoReference: photoReference ?? this.photoReference,
    );
  }
}
