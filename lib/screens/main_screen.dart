import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filter_model.dart';
import '../providers/location_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/restaurant_provider.dart';
import '../utils/router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    final locationProvider = context.read<LocationProvider>();
    if (locationProvider.hasLocationPermission) {
      await locationProvider.getCurrentLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍽️ 선장님 오늘의 메뉴는요?'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => AppNavigation.toSettings(),
          ),
        ],
      ),
      body: Column(
        children: [
          // 지도 영역 (임시)
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      '지도 영역',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Google Maps 연동 예정',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 필터 및 검색 영역
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // 필터 선택 버튼
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _showFilterDialog,
                        icon: const Icon(Icons.filter_list),
                        label: const Text('필터 선택'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // 검색 반경 드롭다운
                    Consumer<RestaurantProvider>(
                      builder: (context, provider, child) {
                        return DropdownButton<double>(
                          value: provider.searchRadius,
                          items: const [
                            DropdownMenuItem(value: 0.5, child: Text('500m')),
                            DropdownMenuItem(value: 1.0, child: Text('1km')),
                            DropdownMenuItem(value: 2.0, child: Text('2km')),
                            DropdownMenuItem(value: 3.0, child: Text('3km')),
                            DropdownMenuItem(value: 4.0, child: Text('4km')),
                            DropdownMenuItem(value: 5.0, child: Text('5km')),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              provider.setSearchRadius(value);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // 검색 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _searchRestaurants,
                    child: const Text('근처 맛집 찾기'),
                  ),
                ),
              ],
            ),
          ),

          // 광고 배너 영역 (임시)
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.amber[100],
            child: const Center(
              child: Text(
                '광고 배너 영역',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),

      // 플로팅 액션 버튼 (랜덤 선택)
      floatingActionButton: FloatingActionButton(
        onPressed: _selectRandomRestaurant,
        child: const Icon(Icons.casino),
      ),

      // 하단 탭바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 헤더
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '필터 선택',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 필터 선택 내용
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Consumer<RestaurantProvider>(
                      builder: (context, provider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1번 필터: 음식 종류
                            Text(
                              '음식 종류',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: FoodType.values.map((foodType) {
                                final isSelected = provider.filter
                                    .isFoodTypeSelected(foodType);
                                return FilterChip(
                                  label: Text(foodType.displayName),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    provider.toggleFoodType(foodType);
                                  },
                                  selectedColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  checkmarkColor:
                                      Theme.of(context).primaryColor,
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 24),

                            // 2번 필터: 메뉴 타입
                            Text(
                              '메뉴 타입',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: MenuType.values.map((menuType) {
                                final isSelected = provider.filter
                                    .isMenuTypeSelected(menuType);
                                return FilterChip(
                                  label: Text(menuType.displayName),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    provider.toggleMenuType(menuType);
                                  },
                                  selectedColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  checkmarkColor:
                                      Theme.of(context).primaryColor,
                                );
                              }).toList(),
                            ),

                            const SizedBox(height: 24),

                            // 현재 선택된 필터 표시
                            if (provider.filter.hasActiveFilters) ...[
                              Text(
                                '선택된 필터',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  provider.filter.filterText,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),

                // 하단 버튼들
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<RestaurantProvider>().resetFilter();
                          Navigator.pop(context);
                        },
                        child: const Text('초기화'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('적용'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _searchRestaurants() async {
    final locationProvider = context.read<LocationProvider>();
    final restaurantProvider = context.read<RestaurantProvider>();
    final authProvider = context.read<AuthProvider>();

    // 위치 권한 확인
    if (!locationProvider.hasLocationPermission) {
      AppNavigation.toLocationError();
      return;
    }

    // 검색 위치 결정
    final searchLocation = locationProvider.searchLocation;

    // 비회원이 위치 변경을 시도하는 경우
    if (!authProvider.isAuthenticated &&
        locationProvider.selectedLocation != null) {
      AppNavigation.toLogin();
      return;
    }

    // 레스토랑 검색
    await restaurantProvider.searchRestaurants(searchLocation);

    // 결과가 없는 경우
    if (restaurantProvider.restaurants.isEmpty) {
      AppNavigation.toNoResultsError();
      return;
    }

    // TODO: 검색 결과 화면으로 이동 (추후 구현)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${restaurantProvider.restaurants.length}개의 맛집을 찾았습니다!'),
      ),
    );
  }

  void _selectRandomRestaurant() {
    final restaurantProvider = context.read<RestaurantProvider>();
    final randomRestaurant = restaurantProvider.getRandomRestaurant();

    if (randomRestaurant != null) {
      AppNavigation.toRestaurantDetail(randomRestaurant.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('먼저 맛집을 검색해주세요!'),
        ),
      );
    }
  }
}
