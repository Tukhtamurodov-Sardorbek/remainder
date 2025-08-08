import 'dart:io';

import 'package:core/core.dart';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class CoreModule {
  @preResolve
  @lazySingleton
  Future<PackageInfo> providePackageInfo() => PackageInfo.fromPlatform();

  @preResolve
  @lazySingleton
  Future<DeviceInfo> provideDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final androidId = await const AndroidId().getId();
      return DeviceInfo(
        androidId,
        '${androidInfo.brand} ${androidInfo.model}',
        Platform.operatingSystemVersion,
        Platform.operatingSystem,
        androidInfo.version.release,
        androidInfo.version.sdkInt,
        isPhysicalDevice: androidInfo.isPhysicalDevice,
      );
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return DeviceInfo(
        iosInfo.identifierForVendor,
        iosInfo.modelName,
        Platform.operatingSystemVersion,
        Platform.operatingSystem,
        iosInfo.systemVersion,
        null,
        isPhysicalDevice: iosInfo.isPhysicalDevice,
      );
    }
    throw UnsupportedError('Unsupported device');
  }

  @lazySingleton
  AppDetails provideAppDetails(PackageInfo packageInfo, DeviceInfo deviceInfo) {
    return AppDetails(packageInfo, deviceInfo);
  }
}
