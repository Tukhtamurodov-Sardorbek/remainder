import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_plugin/overlay_plugin.dart';
import 'package:overlay_plugin/overlay_plugin_platform_interface.dart';
import 'package:overlay_plugin/overlay_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOverlayPluginPlatform
    with MockPlatformInterfaceMixin
    implements OverlayPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OverlayPluginPlatform initialPlatform = OverlayPluginPlatform.instance;

  test('$MethodChannelOverlayPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOverlayPlugin>());
  });

  test('getPlatformVersion', () async {
    OverlayPlugin overlayPlugin = OverlayPlugin();
    MockOverlayPluginPlatform fakePlatform = MockOverlayPluginPlatform();
    OverlayPluginPlatform.instance = fakePlatform;

    expect(await overlayPlugin.getPlatformVersion(), '42');
  });
}
