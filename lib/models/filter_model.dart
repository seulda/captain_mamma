enum FoodType {
  korean('한식'),
  western('양식'),
  chinese('중식'),
  japanese('일식'),
  other('기타');

  const FoodType(this.displayName);
  final String displayName;
}

enum MenuType {
  seafood('해물류'),
  meat('고기류'),
  noodle('면류'),
  rice('밥류'),
  soup('국물류');

  const MenuType(this.displayName);
  final String displayName;
}

class FilterModel {
  final List<FoodType> selectedFoodTypes;
  final List<MenuType> selectedMenuTypes;

  FilterModel({
    this.selectedFoodTypes = const [],
    this.selectedMenuTypes = const [],
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    final foodTypeNames = List<String>.from(json['selectedFoodTypes'] ?? []);
    final menuTypeNames = List<String>.from(json['selectedMenuTypes'] ?? []);

    final selectedFoodTypes = foodTypeNames
        .map((name) => FoodType.values.firstWhere(
              (type) => type.name == name,
              orElse: () => FoodType.korean,
            ))
        .toList();

    final selectedMenuTypes = menuTypeNames
        .map((name) => MenuType.values.firstWhere(
              (type) => type.name == name,
              orElse: () => MenuType.seafood,
            ))
        .toList();

    return FilterModel(
      selectedFoodTypes: selectedFoodTypes,
      selectedMenuTypes: selectedMenuTypes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedFoodTypes': selectedFoodTypes.map((e) => e.name).toList(),
      'selectedMenuTypes': selectedMenuTypes.map((e) => e.name).toList(),
    };
  }

  FilterModel copyWith({
    List<FoodType>? selectedFoodTypes,
    List<MenuType>? selectedMenuTypes,
  }) {
    return FilterModel(
      selectedFoodTypes: selectedFoodTypes ?? this.selectedFoodTypes,
      selectedMenuTypes: selectedMenuTypes ?? this.selectedMenuTypes,
    );
  }

  // 기본 필터 (모든 항목 선택 안함)
  factory FilterModel.defaultFilter() {
    return FilterModel(
      selectedFoodTypes: [],
      selectedMenuTypes: [],
    );
  }

  // 모든 항목 선택된 필터
  factory FilterModel.allSelected() {
    return FilterModel(
      selectedFoodTypes: FoodType.values,
      selectedMenuTypes: MenuType.values,
    );
  }

  // 필터가 적용되었는지 확인
  bool get hasActiveFilters {
    return selectedFoodTypes.isNotEmpty || selectedMenuTypes.isNotEmpty;
  }

  // 선택된 필터 개수
  int get activeFilterCount {
    return selectedFoodTypes.length + selectedMenuTypes.length;
  }

  // 특정 음식 종류가 선택되었는지 확인
  bool isFoodTypeSelected(FoodType foodType) {
    return selectedFoodTypes.contains(foodType);
  }

  // 특정 메뉴 타입이 선택되었는지 확인
  bool isMenuTypeSelected(MenuType menuType) {
    return selectedMenuTypes.contains(menuType);
  }

  // 필터 텍스트 표현
  String get filterText {
    List<String> parts = [];

    if (selectedFoodTypes.isNotEmpty) {
      parts.add(selectedFoodTypes.map((e) => e.displayName).join(', '));
    }

    if (selectedMenuTypes.isNotEmpty) {
      parts.add(selectedMenuTypes.map((e) => e.displayName).join(', '));
    }

    if (parts.isEmpty) {
      return '전체';
    }

    return parts.join(' · ');
  }

  @override
  String toString() {
    return 'FilterModel(foodTypes: ${selectedFoodTypes.length}, menuTypes: ${selectedMenuTypes.length})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FilterModel &&
        _listEquals(other.selectedFoodTypes, selectedFoodTypes) &&
        _listEquals(other.selectedMenuTypes, selectedMenuTypes);
  }

  @override
  int get hashCode {
    return selectedFoodTypes.hashCode ^ selectedMenuTypes.hashCode;
  }

  // 리스트 비교 헬퍼 함수
  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
