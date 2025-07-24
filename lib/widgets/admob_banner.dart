import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/env_config.dart';

/// AdMob 배너 광고 위젯
class AdMobBanner extends StatefulWidget {
  const AdMobBanner({super.key});

  @override
  State<AdMobBanner> createState() => _AdMobBannerState();
}

class _AdMobBannerState extends State<AdMobBanner> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  /// 배너 광고 로드
  void _loadBannerAd() {
    // 배너 광고 단위 ID 가져오기 (환경 변수에서)
    final adUnitId = EnvConfig.getBannerAdUnitId();

    debugPrint('🎯 AdMob 배너 광고 로드 시작');
    debugPrint('📍 광고 단위 ID: $adUnitId');
    debugPrint('🔧 디버그 모드: ${EnvConfig.isDebugMode}');

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('✅ AdMob 배너 광고 로드 성공');
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('❌ AdMob 배너 광고 로드 실패: $error');
          ad.dispose();
          setState(() {
            _isLoaded = false;
          });
        },
        onAdOpened: (ad) {
          debugPrint('🔗 AdMob 배너 광고 클릭됨');
        },
        onAdClosed: (ad) {
          debugPrint('🔒 AdMob 배너 광고 닫힘');
        },
      ),
    );

    _bannerAd!.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AdMob 설정이 제대로 되어 있지 않은 경우
    if (!EnvConfig.isAdmobAndroidConfigValid && !EnvConfig.isDebugMode) {
      return Container(
        height: 50,
        color: Colors.grey[200],
        child: const Center(
          child: Text(
            '광고 설정이 필요합니다',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    // 광고가 로드되지 않은 경우
    if (!_isLoaded || _bannerAd == null) {
      return Container(
        height: 50,
        color: Colors.grey[100],
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '광고 로드 중...',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    // 광고 위젯 표시
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
