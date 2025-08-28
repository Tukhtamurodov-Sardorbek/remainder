import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'overlay_plugin_platform_interface.dart';

/// An implementation of [OverlayPluginPlatform] that uses method channels.
class MethodChannelOverlayPlugin extends OverlayPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('overlay_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
