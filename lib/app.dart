import 'package:backend_services/backend_services.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:remainder/di/injector.dart';

class RemainderApp extends StatelessWidget {
  const RemainderApp({super.key});

  static Future<void> setup() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await AndroidAlarmManager.initialize();
    await Future.wait([
      configureDependencies(),
      AppBackendService.instance.init(),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    ]);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: MaterialApp(
        home: Home(),
        title: 'Flutter Demo',
        theme: AppThemeConfig.ref.data,
        // The navigator key is necessary to allow to navigate through static methods
        navigatorKey: AppNavigatorKey.navigatorKey,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(1.0)),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                overscroll: false,
                physics: const BouncingScrollPhysics(),
              ),
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.transparent,
                ),
                child: child!,
              ),
            ),
          );
        },
        navigatorObservers: AppBackendService.instance.navigationObservers,
        routes: {'/fullScreenTest': (context) => FullScreenTest()},
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const platform = MethodChannel('com.example.overlay_plugin/overlay');
  late final ValueNotifier<BannerAd?> _bannerNotifier;
  late final ValueNotifier<InterstitialAd?> _interstitialAd;
  late final ValueNotifier<RewardedAd?> _rewardedAd;

  @override
  void initState() {
    super.initState();
    _bannerNotifier = ValueNotifier(null);
    _interstitialAd = ValueNotifier(null);
    _rewardedAd = ValueNotifier(null);
    Future.microtask(() async {
      final bannerId = await AppAdvertisements.ref.bannerAdUnitId;
      final interstitialId = await AppAdvertisements.ref.interstitialAdUnitId;
      final rewardedId = await AppAdvertisements.ref.rewardedAdUnitId;
      if (bannerId != null) {
        final ad = BannerAd(
          size: AdSize.banner,
          request: AdRequest(),
          adUnitId: 'ca-app-pub-3940256099942544/6300978111', // bannerId
          listener: BannerAdListener(
            onAdLoaded: (ad) {
              _bannerNotifier.value = ad as BannerAd;
            },
            onAdFailedToLoad: (ad, e) {
              debugPrint("❌ Failed to load banner: ${e.code} - ${e.message}");
              ad.dispose();
            },
          ),
        );
        ad.load();
      }
      if (interstitialId != null) {
        InterstitialAd.load(
          request: AdRequest(),
          adUnitId: 'ca-app-pub-3940256099942544/1033173712', // interstitialId
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) => debugPrint('Ad showed.'),
                onAdDismissedFullScreenContent: (ad) {
                  debugPrint('Ad dismissed.');
                  ad.dispose();
                },
                onAdFailedToShowFullScreenContent: (ad, e) {
                  debugPrint('Failed to show interstitial ad: $e');
                  ad.dispose();
                },
              );
              _interstitialAd.value = ad;
            },
            onAdFailedToLoad: (e) {
              debugPrint(
                "❌ Failed to load interstitial ad: ${e.code} - ${e.message}",
              );
            },
          ),
        );
      }
      if (rewardedId != null) {
        RewardedAd.load(
          request: AdRequest(),
          adUnitId: 'ca-app-pub-3940256099942544/5224354917', // rewardedId
          rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) {
              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) => debugPrint('Ad showed.'),
                onAdDismissedFullScreenContent: (ad) {
                  debugPrint('Ad dismissed.');
                  ad.dispose();
                },
                onAdFailedToShowFullScreenContent: (ad, e) {
                  debugPrint('Failed to show rewarded ad: $e');
                  ad.dispose();
                },
              );
              _rewardedAd.value = ad;
            },
            onAdFailedToLoad: (e) {
              debugPrint(
                "❌ Failed to load rewarded ad: ${e.code} - ${e.message}",
              );
            },
          ),
        );
      }
      final fullScreenIntentPluginTest =
          await AppBackgroundManager.initPlatformState();
      print('object test: $fullScreenIntentPluginTest');
    });
  }

  @override
  void dispose() {
    _bannerNotifier.value?.dispose();
    _interstitialAd.value?.dispose();
    _rewardedAd.value?.dispose();
    _bannerNotifier.dispose();
    _interstitialAd.dispose();
    _rewardedAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('App Bar')),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ElevatedButton(
                //   onPressed: () async {
                //     // throw Exception('New Exception test');
                //     // AppFirebaseAnalyticsImpl.ref.clickTest();
                //
                //     // if (await Permission.systemAlertWindow.request().isGranted) {
                //     //   try {
                //     //     await platform.invokeMethod('startOverlay');
                //     //   } on PlatformException catch (e) {
                //     //     print("Failed to start overlay: '${e.message}'.");
                //     //   }
                //     // } else {
                //     //   // Handle permission denied
                //     //   print("Overlay permission denied");
                //     // }
                //
                //     // final canSchedule = await AlarmPermission.canScheduleExactAlarms();
                //     //
                //     // if (!canSchedule) {
                //     //   // Redirect user to system settings
                //     //   await AlarmPermission.openExactAlarmSettings();
                //     //   return;
                //     // }
                //     //
                //     // AppBackgroundManager.scheduleOpen();
                //
                //
                //
                //     // AppAwesomeNotification().showFullScreenNotification();
                //   },
                //   child: const Text('Fire an event'),
                // ),
                AppIconSvg.asset(AppAsset.icPillMind, height: 200),
              ],
            ),
          ),
          // ValueListenableBuilder(
          //   valueListenable: _bannerNotifier,
          //   builder: (context, banner, _) {
          //     if (banner != null) {
          //       return Positioned(
          //         top: 0,
          //         left: 0,
          //         right: 0,
          //         height: banner.size.height.toDouble(),
          //         child: AdWidget(ad: banner),
          //       );
          //     }
          //     return SizedBox.shrink();
          //   },
          // ),
        ],
      ),
      floatingActionButton: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            child: Text('Show Interstitial Ad'),
            onPressed: () {
              _interstitialAd.value?.show();
            },
          ),
          ElevatedButton(
            child: Text('Show Rewarded Ad'),
            onPressed: () {
              _rewardedAd.value?.show(
                onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
                  debugPrint(
                    'User earned reward: ${reward.amount} ${reward.type}',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'You earned ${reward.amount} ${reward.type}!',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class FullScreenTest extends StatelessWidget {
  const FullScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full Screen Widget')),
      body: Center(child: Text('This is a full-screen Flutter widget!')),
    );
  }
}

class AlarmPermission {
  static const MethodChannel _channel = MethodChannel("alarm_permission");

  static Future<bool> canScheduleExactAlarms() async {
    final bool result = await _channel.invokeMethod("canScheduleExactAlarms");
    print('>>>> canScheduleExactAlarms: $result');
    return result;
    // const MethodChannel _channel = MethodChannel("alarm_permission");
    // String batteryLevel;
    // try {
    //   final result = await _channel.invokeMethod<bool>('canScheduleExactAlarms');
    //   batteryLevel = 'Battery level at $result % .';
    // } on PlatformException catch (e) {
    //   batteryLevel = "Failed to get battery level: '${e.message}'.";
    // }
    //
    // print('LOOK:$batteryLevel');
  }

  static Future<void> openExactAlarmSettings() async {
    await _channel.invokeMethod("openExactAlarmSettings");
  }
}
