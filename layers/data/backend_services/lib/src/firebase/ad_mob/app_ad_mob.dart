import 'dart:io' show Platform;

import 'package:core/core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// https://www.youtube.com/watch?v=8btAL8YVujY
/// https://admob.google.com/v2/home
class AppAdvertisements {
  const AppAdvertisements._();

  static AppAdvertisements? _instance;

  static AppAdvertisements get ref => _instance ??= AppAdvertisements._();

  Future<String>? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return AppEncryptedData.ref.androidBannerUnitId;
    } else if (Platform.isIOS) {
      return AppEncryptedData.ref.iosBannerUnitId;
    }
    return null;
  }

  Future<String>? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return AppEncryptedData.ref.androidInterstitialUnitId;
    } else if (Platform.isIOS) {
      return null;
    }
    return null;
  }

  Future<String>? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return AppEncryptedData.ref.androidRewardedUnitId;
    } else if (Platform.isIOS) {
      return null;
    }
    return null;
  }

  Future<void> init() {
    return MobileAds.instance.initialize();
  }
}
