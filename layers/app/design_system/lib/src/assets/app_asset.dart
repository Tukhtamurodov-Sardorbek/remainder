enum AssetType { png, svg }

final class AppAsset {
  AppAsset._();

  static const String _base = 'assets/icons';

  static String get icPillMind => '$_base/ic_pill_mind.svg';
}
