class RestaurantModel {
  final String id;
  final String name;
  final String category;
  final double rating;
  final String address;
  final double latitude;
  final double longitude;
  final double distance; // km
  final String? phone;
  final String? imageUrl;
  final List<String> tags;
  final String? priceRange;
  final String? openingHours;
  final bool isOpen;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance,
    this.phone,
    this.imageUrl,
    this.tags = const [],
    this.priceRange,
    this.openingHours,
    this.isOpen = true,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      address: json['address'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      distance: (json['distance'] ?? 0.0).toDouble(),
      phone: json['phone'],
      imageUrl: json['imageUrl'],
      tags: List<String>.from(json['tags'] ?? []),
      priceRange: json['priceRange'],
      openingHours: json['openingHours'],
      isOpen: json['isOpen'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'rating': rating,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'distance': distance,
      'phone': phone,
      'imageUrl': imageUrl,
      'tags': tags,
      'priceRange': priceRange,
      'openingHours': openingHours,
      'isOpen': isOpen,
    };
  }

  RestaurantModel copyWith({
    String? id,
    String? name,
    String? category,
    double? rating,
    String? address,
    double? latitude,
    double? longitude,
    double? distance,
    String? phone,
    String? imageUrl,
    List<String>? tags,
    String? priceRange,
    String? openingHours,
    bool? isOpen,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distance: distance ?? this.distance,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
      priceRange: priceRange ?? this.priceRange,
      openingHours: openingHours ?? this.openingHours,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  // 거리를 사용자 친화적 형식으로 반환
  String get distanceText {
    if (distance < 1) {
      return '${(distance * 1000).round()}m';
    } else {
      return '${distance.toStringAsFixed(1)}km';
    }
  }

  // 평점을 별점 형식으로 반환
  String get ratingText {
    return '⭐${rating.toStringAsFixed(1)}';
  }

  // 가격대를 사용자 친화적 형식으로 반환
  String get priceRangeText {
    if (priceRange == null) return '가격 정보 없음';
    return '💰 $priceRange';
  }

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, category: $category, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RestaurantModel &&
        other.id == id &&
        other.name == name &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ category.hashCode;
  }
} 