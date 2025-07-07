import 'package:dio/dio.dart';
import 'dart:math';
import '../models/restaurant_model.dart';
import '../models/filter_model.dart';
import '../utils/env_config.dart';

class RestaurantService {
  final Dio _dio = Dio();
  
  // 환경 변수에서 API 키 가져오기
  String get kakaoApiKey => EnvConfig.kakaoApiKey;
  String get naverClientId => EnvConfig.naverClientId;
  String get naverClientSecret => EnvConfig.naverClientSecret;

  RestaurantService() {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  // 근처 레스토랑 검색 (카카오 로컬 API 사용)
  Future<List<RestaurantModel>> searchNearbyRestaurants({
    required double latitude,
    required double longitude,
    required double radius,
    List<FoodType> foodTypes = const [],
    List<MenuType> menuTypes = const [],
  }) async {
    try {
      // 카테고리 코드 생성
      String category = _buildCategoryCode(foodTypes);
      
      final response = await _dio.get(
        'https://dapi.kakao.com/v2/local/search/category.json',
        options: Options(
          headers: {'Authorization': 'KakaoAK $kakaoApiKey'},
        ),
        queryParameters: {
          'category_group_code': category.isNotEmpty ? category : 'FD6', // 음식점
          'x': longitude,
          'y': latitude,
          'radius': (radius * 1000).toInt(), // m 단위로 변환
          'sort': 'distance',
          'size': 15,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> documents = response.data['documents'];
        List<RestaurantModel> restaurants = [];

        for (final doc in documents) {
          final restaurant = _parseKakaoResponse(doc, latitude, longitude);
          
          // 메뉴 타입 필터링
          if (menuTypes.isNotEmpty && !_matchesMenuTypes(restaurant, menuTypes)) {
            continue;
          }
          
          restaurants.add(restaurant);
        }

        return restaurants;
      }
      
      return [];
    } catch (e) {
      print('레스토랑 검색 실패: $e');
      // 개발 중에는 더미 데이터 반환
      return _getDummyRestaurants(latitude, longitude, radius);
    }
  }

  // 레스토랑 상세 정보 가져오기
  Future<RestaurantModel?> getRestaurantDetails(String restaurantId) async {
    try {
      final response = await _dio.get(
        'https://dapi.kakao.com/v2/local/search/keyword.json',
        options: Options(
          headers: {'Authorization': 'KakaoAK $kakaoApiKey'},
        ),
        queryParameters: {
          'query': restaurantId,
          'size': 1,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> documents = response.data['documents'];
        if (documents.isNotEmpty) {
          return _parseKakaoResponse(documents.first, 0, 0);
        }
      }
      
      return null;
    } catch (e) {
      print('레스토랑 상세 정보 가져오기 실패: $e');
      return null;
    }
  }

  // 카카오 API 응답 파싱
  RestaurantModel _parseKakaoResponse(
    Map<String, dynamic> doc,
    double searchLat,
    double searchLng,
  ) {
    final lat = double.parse(doc['y']);
    final lng = double.parse(doc['x']);
    final distance = _calculateDistance(searchLat, searchLng, lat, lng);

    return RestaurantModel(
      id: doc['id'],
      name: doc['place_name'],
      category: doc['category_name'].split(' > ').last,
      rating: 4.0 + Random().nextDouble(), // TODO: 실제 평점 API 연동
      address: doc['address_name'],
      latitude: lat,
      longitude: lng,
      distance: distance,
      phone: doc['phone'],
      tags: _generateTags(doc['category_name']),
    );
  }

  // 카테고리 코드 생성
  String _buildCategoryCode(List<FoodType> foodTypes) {
    if (foodTypes.isEmpty) return 'FD6'; // 음식점 전체
    
    // 음식 종류에 따른 카테고리 매핑
    final categoryMap = {
      FoodType.korean: 'FD6',
      FoodType.western: 'FD6',
      FoodType.chinese: 'FD6',
      FoodType.japanese: 'FD6',
      FoodType.other: 'FD6',
    };
    
    return categoryMap[foodTypes.first] ?? 'FD6';
  }

  // 메뉴 타입 매칭
  bool _matchesMenuTypes(RestaurantModel restaurant, List<MenuType> menuTypes) {
    for (final menuType in menuTypes) {
      if (restaurant.tags.any((tag) => tag.contains(menuType.displayName))) {
        return true;
      }
    }
    return false;
  }

  // 태그 생성
  List<String> _generateTags(String categoryName) {
    List<String> tags = [];
    
    if (categoryName.contains('한식')) tags.add('한식');
    if (categoryName.contains('중식')) tags.add('중식');
    if (categoryName.contains('일식')) tags.add('일식');
    if (categoryName.contains('양식')) tags.add('양식');
    if (categoryName.contains('치킨')) tags.add('고기류');
    if (categoryName.contains('고기')) tags.add('고기류');
    if (categoryName.contains('해물')) tags.add('해물류');
    if (categoryName.contains('면')) tags.add('면류');
    if (categoryName.contains('국수')) tags.add('면류');
    if (categoryName.contains('밥')) tags.add('밥류');
    if (categoryName.contains('국')) tags.add('국물류');
    if (categoryName.contains('찌개')) tags.add('국물류');
    
    return tags;
  }

  // 거리 계산 (Haversine 공식)
  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371; // km
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);
    
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  // 개발용 더미 데이터
  List<RestaurantModel> _getDummyRestaurants(
    double latitude,
    double longitude,
    double radius,
  ) {
    final random = Random();
    List<RestaurantModel> dummyRestaurants = [
      RestaurantModel(
        id: '1',
        name: '한우마을',
        category: '한식',
        rating: 4.2,
        address: '서울시 강남구 역삼동',
        latitude: latitude + (random.nextDouble() - 0.5) * 0.01,
        longitude: longitude + (random.nextDouble() - 0.5) * 0.01,
        distance: random.nextDouble() * radius,
        phone: '02-1234-5678',
        tags: ['한식', '고기류'],
        priceRange: '15,000~25,000원',
        openingHours: '11:00-22:00',
      ),
      RestaurantModel(
        id: '2',
        name: '김치찌개집',
        category: '한식',
        rating: 4.0,
        address: '서울시 강남구 논현동',
        latitude: latitude + (random.nextDouble() - 0.5) * 0.01,
        longitude: longitude + (random.nextDouble() - 0.5) * 0.01,
        distance: random.nextDouble() * radius,
        phone: '02-2345-6789',
        tags: ['한식', '국물류'],
        priceRange: '8,000~12,000원',
        openingHours: '11:00-21:00',
      ),
      RestaurantModel(
        id: '3',
        name: '불고기집',
        category: '한식',
        rating: 4.5,
        address: '서울시 강남구 삼성동',
        latitude: latitude + (random.nextDouble() - 0.5) * 0.01,
        longitude: longitude + (random.nextDouble() - 0.5) * 0.01,
        distance: random.nextDouble() * radius,
        phone: '02-3456-7890',
        tags: ['한식', '고기류'],
        priceRange: '20,000~30,000원',
        openingHours: '17:00-01:00',
      ),
    ];

    return dummyRestaurants;
  }
} 