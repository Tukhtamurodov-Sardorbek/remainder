
import 'overlay_plugin_platform_interface.dart';

class OverlayPlugin {
  Future<String?> getPlatformVersion() {
    return OverlayPluginPlatform.instance.getPlatformVersion();
  }
}
