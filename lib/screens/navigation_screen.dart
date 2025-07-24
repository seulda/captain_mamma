import 'package:flutter/material.dart';
import '../utils/router.dart';

class NavigationScreen extends StatelessWidget {
  final String? restaurantId;
  final String? restaurantName;
  final double? latitude;
  final double? longitude;

  const NavigationScreen({
    super.key,
    this.restaurantId,
    this.restaurantName,
    this.latitude,
    this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('길안내 to ${restaurantName ?? "레스토랑"}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppNavigation.back(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.navigation,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              '길안내 화면',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '목적지: ${restaurantName ?? "알 수 없음"}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            if (latitude != null && longitude != null)
              Text(
                '좌표: ${latitude!.toStringAsFixed(4)}, ${longitude!.toStringAsFixed(4)}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(height: 32),
            const Text(
              '네비게이션 기능 준비 중',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
