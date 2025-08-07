import 'package:core/src/models/device_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class AppDetails {
  final PackageInfo _packageInfo;
  final DeviceInfo _deviceInfo;

  AppDetails(this._packageInfo, this._deviceInfo);

  String get appVersion => _packageInfo.version;

  String get appBuild => _packageInfo.buildNumber;

  String get deviceId => _deviceInfo.deviceId ?? '';

  String get deviceOS => _deviceInfo.deviceOS ?? '';

  String get deviceType => _deviceInfo.deviceType ?? '';

  String get deviceModel => _deviceInfo.deviceModel ?? '';

  int? get systemVersionSdk => _deviceInfo.systemVersionSdk;

  /// TODO: Provide apple team id as a prefix [e.g. 8UE9E9J90.]
  String get groupKeychain => _packageInfo.packageName;

  String get groupId => 'group.${_packageInfo.packageName}';
}
