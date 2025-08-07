class DeviceInfo {
  final String? deviceId;
  final String? deviceModel;
  final String? deviceOS;
  final String? deviceType;
  final String? systemVersion;
  final int? systemVersionSdk;
  final bool isPhysicalDevice;

  DeviceInfo(
    this.deviceId,
    this.deviceModel,
    this.deviceOS,
    this.deviceType,
    this.systemVersion,
    this.systemVersionSdk, {
    this.isPhysicalDevice = false,
  });
}
