enum AssetType { png, svg }

final class AppAsset {
  AppAsset._();

  static const String _base = 'assets/icons';

  static String get icPillMindSvg => '$_base/ic_pill_mind.svg';

  static String get icPillMindPng => '$_base/ic_pill_mind.png';

  static String onboarding(int index) => '$_base/onboarding_$index.png';

  static String get onboarding1 => '$_base/onboarding_1.png';

  static String get onboarding2 => '$_base/onboarding_2.png';

  static String get onboarding3 => '$_base/onboarding_3.png';

  static String get icGoogleLogo => '$_base/ic_google_logo.png';

  static String get icAppleLogo => '$_base/ic_apple_logo.png';

  static String get icEye => '$_base/ic_eye.svg';

  static String get icEyeClosed => '$_base/ic_eye_closed.svg';
}
