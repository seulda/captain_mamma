import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/restaurant_model.dart';
import '../models/filter_model.dart';
import '../models/location_model.dart';
import '../services/restaurant_service.dart';

class RestaurantProvider extends ChangeNotifier {
  List<RestaurantModel> _restaurants = [];
  List<RestaurantModel> _filteredRestaurants = [];
  FilterModel _filter = FilterModel.defaultFilter();
  bool _isLoading = false;
  String? _errorMessage;
  double _searchRadius = 1.0; // km
  RestaurantSortType _sortType = RestaurantSortType.distance;

  List<RestaurantModel> get restaurants => _filteredRestaurants;
  FilterModel get filter => _filter;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  double get searchRadius => _searchRadius;
  RestaurantSortType get sortType => _sortType;

  final RestaurantService _restaurantService = RestaurantService();

  RestaurantProvider() {
    _loadSavedSettings();
  }

  // 레스토랑 검색
  Future<void> searchRestaurants(LocationModel location) async {
    _setLoading(true);
    _clearError();

    try {
      final results = await _restaurantService.searchNearbyRestaurants(
        latitude: location.latitude,
        longitude: location.longitude,
        radius: _searchRadius,
        foodTypes: _filter.selectedFoodTypes,
        menuTypes: _filter.selectedMenuTypes,
      );

      _restaurants = results;
      _applyFilter();
      _saveSearchHistory(location);
    } catch (e) {
      debugPrint('레스토랑 검색 실패: $e');
      _setError('레스토랑 검색 중 오류가 발생했습니다.');
      _restaurants = [];
      _filteredRestaurants = [];
    } finally {
      _setLoading(false);
    }
  }

  // 필터 적용
  void _applyFilter() {
    _filteredRestaurants = _restaurants.where((restaurant) {
      // 음식 종류 필터
      if (_filter.selectedFoodTypes.isNotEmpty) {
        bool matchesFoodType = _filter.selectedFoodTypes.any(
          (type) => restaurant.category.contains(type.name),
        );
        if (!matchesFoodType) return false;
      }

      // 메뉴 타입 필터
      if (_filter.selectedMenuTypes.isNotEmpty) {
        bool matchesMenuType = _filter.selectedMenuTypes.any(
          (type) => restaurant.tags.contains(type.name),
        );
        if (!matchesMenuType) return false;
      }

      return true;
    }).toList();

    _sortRestaurants();
    notifyListeners();
  }

  // 레스토랑 정렬
  void _sortRestaurants() {
    switch (_sortType) {
      case RestaurantSortType.distance:
        _filteredRestaurants.sort((a, b) => a.distance.compareTo(b.distance));
        break;
      case RestaurantSortType.rating:
        _filteredRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
  }

  // 필터 업데이트
  void updateFilter(FilterModel newFilter) {
    _filter = newFilter;
    _applyFilter();
    _saveFilterSettings();
  }

  // 음식 종류 필터 토글
  void toggleFoodType(FoodType foodType) {
    if (_filter.selectedFoodTypes.contains(foodType)) {
      _filter.selectedFoodTypes.remove(foodType);
    } else {
      _filter.selectedFoodTypes.add(foodType);
    }
    _applyFilter();
    _saveFilterSettings();
  }

  // 메뉴 타입 필터 토글
  void toggleMenuType(MenuType menuType) {
    if (_filter.selectedMenuTypes.contains(menuType)) {
      _filter.selectedMenuTypes.remove(menuType);
    } else {
      _filter.selectedMenuTypes.add(menuType);
    }
    _applyFilter();
    _saveFilterSettings();
  }

  // 검색 반경 설정
  void setSearchRadius(double radius) {
    _searchRadius = radius;
    _saveFilterSettings();
    notifyListeners();
  }

  // 정렬 방식 설정
  void setSortType(RestaurantSortType sortType) {
    _sortType = sortType;
    _sortRestaurants();
    _saveFilterSettings();
    notifyListeners();
  }

  // 필터 초기화
  void resetFilter() {
    _filter = FilterModel.defaultFilter();
    _applyFilter();
    _saveFilterSettings();
  }

  // 랜덤 레스토랑 선택
  RestaurantModel? getRandomRestaurant() {
    if (_filteredRestaurants.isEmpty) return null;
    
    final random = DateTime.now().millisecondsSinceEpoch % _filteredRestaurants.length;
    return _filteredRestaurants[random];
  }

  // 레스토랑 상세 정보 가져오기
  Future<RestaurantModel?> getRestaurantDetails(String restaurantId) async {
    try {
      return await _restaurantService.getRestaurantDetails(restaurantId);
    } catch (e) {
      debugPrint('레스토랑 상세 정보 가져오기 실패: $e');
      return null;
    }
  }

  // 필터 설정 저장
  Future<void> _saveFilterSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // 음식 종류 필터 저장
      final foodTypeNames = _filter.selectedFoodTypes.map((e) => e.name).toList();
      await prefs.setStringList('selectedFoodTypes', foodTypeNames);
      
      // 메뉴 타입 필터 저장
      final menuTypeNames = _filter.selectedMenuTypes.map((e) => e.name).toList();
      await prefs.setStringList('selectedMenuTypes', menuTypeNames);
      
      // 검색 반경 저장
      await prefs.setDouble('searchRadius', _searchRadius);
      
      // 정렬 방식 저장
      await prefs.setString('sortType', _sortType.name);
    } catch (e) {
      debugPrint('필터 설정 저장 실패: $e');
    }
  }

  // 저장된 설정 불러오기
  Future<void> _loadSavedSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // 음식 종류 필터 불러오기
      final foodTypeNames = prefs.getStringList('selectedFoodTypes') ?? [];
      final selectedFoodTypes = foodTypeNames
          .map((name) => FoodType.values.firstWhere(
                (type) => type.name == name,
                orElse: () => FoodType.korean,
              ))
          .toList();
      
      // 메뉴 타입 필터 불러오기
      final menuTypeNames = prefs.getStringList('selectedMenuTypes') ?? [];
      final selectedMenuTypes = menuTypeNames
          .map((name) => MenuType.values.firstWhere(
                (type) => type.name == name,
                orElse: () => MenuType.seafood,
              ))
          .toList();
      
      _filter = FilterModel(
        selectedFoodTypes: selectedFoodTypes,
        selectedMenuTypes: selectedMenuTypes,
      );
      
      // 검색 반경 불러오기
      _searchRadius = prefs.getDouble('searchRadius') ?? 1.0;
      
      // 정렬 방식 불러오기
      final sortTypeName = prefs.getString('sortType') ?? 'distance';
      _sortType = RestaurantSortType.values.firstWhere(
        (type) => type.name == sortTypeName,
        orElse: () => RestaurantSortType.distance,
      );
      
      notifyListeners();
    } catch (e) {
      debugPrint('저장된 설정 불러오기 실패: $e');
    }
  }

  // 검색 기록 저장
  Future<void> _saveSearchHistory(LocationModel location) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final searchHistory = prefs.getStringList('searchHistory') ?? [];
      
      final searchItem = '${location.address}|${location.latitude}|${location.longitude}';
      searchHistory.remove(searchItem); // 중복 제거
      searchHistory.insert(0, searchItem); // 최상단에 추가
      
      // 최대 10개까지만 저장
      if (searchHistory.length > 10) {
        searchHistory.removeRange(10, searchHistory.length);
      }
      
      await prefs.setStringList('searchHistory', searchHistory);
    } catch (e) {
      debugPrint('검색 기록 저장 실패: $e');
    }
  }

  // 검색 기록 불러오기
  Future<List<LocationModel>> getSearchHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final searchHistory = prefs.getStringList('searchHistory') ?? [];
      
      return searchHistory.map((item) {
        final parts = item.split('|');
        if (parts.length == 3) {
          return LocationModel(
            latitude: double.parse(parts[1]),
            longitude: double.parse(parts[2]),
            address: parts[0],
            timestamp: DateTime.now(),
          );
        }
        return null;
      }).where((item) => item != null).cast<LocationModel>().toList();
    } catch (e) {
      debugPrint('검색 기록 불러오기 실패: $e');
      return [];
    }
  }

  // 로딩 상태 설정
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // 에러 메시지 설정
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  // 에러 메시지 삭제
  void _clearError() {
    _errorMessage = null;
  }
}

enum RestaurantSortType {
  distance,
  rating,
} 