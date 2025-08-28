import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'overlay_plugin_method_channel.dart';

abstract class OverlayPluginPlatform extends PlatformInterface {
  /// Constructs a OverlayPluginPlatform.
  OverlayPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static OverlayPluginPlatform _instance = MethodChannelOverlayPlugin();

  /// The default instance of [OverlayPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelOverlayPlugin].
  static OverlayPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OverlayPluginPlatform] when
  /// they register themselves.
  static set instance(OverlayPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
