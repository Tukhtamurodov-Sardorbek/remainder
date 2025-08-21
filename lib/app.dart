import 'package:backend_services/backend_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remainder/di/injector.dart';

class RemainderApp extends StatelessWidget {
  const RemainderApp({super.key});

  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
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
            child: ElevatedButton(
              onPressed: () {
                // throw Exception('New Exception test');
                AppFirebaseAnalyticsImpl.ref.clickTest();
              },
              child: const Text('Fire an event'),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _bannerNotifier,
            builder: (context, banner, _) {
              if (banner != null) {
                return Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: banner.size.height.toDouble(),
                  child: AdWidget(ad: banner),
                );
              }
              return SizedBox.shrink();
            },
          ),
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
                  debugPrint('User earned reward: ${reward.amount} ${reward.type}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You earned ${reward.amount} ${reward.type}!')),
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
