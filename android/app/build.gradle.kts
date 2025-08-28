// Applies build plugins to the app module
plugins {
    // The Android Gradle Plugin (AGP) for application modules (produces APK/AAB)
    id("com.android.application")
    // Enables Kotlin on Android (Kotlin compiler, stdlib wiring)
    id("kotlin-android")
    // ######################################################################################
    /// The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins
    // ######################################################################################
    // Flutter’s plugin that wires Dart/Flutter build steps into the Android build (AOT/JIT, asset bundling, JNI glue, etc.)
    // Must come after AGP and Kotlin so it can integrate with them
    id("dev.flutter.flutter-gradle-plugin")
    // The Google Services plugin that reads google-services.json and generates res/values/google_services.xml, wiring Firebase/Play services configs into your app
    id("com.google.gms.google-services")
    // Adds Crashlytics tasks (upload mapping files, native symbols, etc.) and integrates Crashlytics into your build
    id("com.google.firebase.crashlytics")
}

// Main AGP configuration for the app
android {
    // Required by AGP 8+. It defines the package name for generated R classes and is used in manifest merging and resource scoping. Usually mirrors your app package, but can differ from applicationId
    namespace = "com.example.remainder"
    // Which Android SDK you compile against (APIs available at compile time). The Flutter Gradle plugin exposes flutter.compileSdkVersion, synced to your Flutter version’s recommended level
    // Raising compileSdk lets you use newer APIs. It doesn’t affect which devices can install your app [that’s minSdk]
    // If you compile with API 36 (Android 16), you can use new APIs from Android 16 in your code.
    // But remember: if your minSdk is 23, you must guard new APIs with runtime checks to avoid crashes on older devices
    compileSdk = flutter.compileSdkVersion
    // Locks the Android NDK version for native builds (plugins with C/C++ code). Pinning avoids build cache invalidation and “wrong NDK” errors on CI/team machines
    ndkVersion = "27.0.12077973" // flutter.ndkVersion

    // Sets Java language level used by Java sources and the bytecode target
    // AGP 8 commonly expects Java 17, but many Flutter/Android templates pin 11 for broader toolchain compatibility. (If you move to newer libs/AGP, you may later bump this to 17.)
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    // The base config for all build variants
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        // The install package name used on device/Play Store (can differ from namespace)
        // Change this to your real reverse-DNS id (e.g., com.yourcompany.reminder)
        applicationId = "com.example.remainder"
        // You can update the following values to match your application needs
        // For more information, see: https://flutter.dev/to/review-gradle-config
        // Minimum Android version your app supports (Android 6.0), older devices can’t install it
        minSdk = 23 // flutter.minSdkVersion
        // If Flutter’s current stable is synced with Android 15 (API 35), then your app declares it’s tested against API 35
        // Google Play requires you to keep this near the latest (currently API 34+ for 2024, and API 35+ soon)
        // If you lag behind, Play Store may block updates
        targetSdk = flutter.targetSdkVersion
        // Flutter reads your pubspec.yaml version: 1.2.3+45 and exports: versionName = "1.2.3", versionCode = 45
        // Google Play requires versionCode to increase on every release
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Defines build variants like debug and release
    buildTypes {
        // Crucial for publishing: replace this with a real release keystore (either via
        // signingConfigs { release { ... } } and buildTypes.release.signingConfig = signingConfigs.release,
        // or via gradle.properties/keystore.properties).
        // Without that, Play Store will reject uploads or you won’t be able to reproduce a signed artifact.
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
// Flutter Gradle plugin block.
// `source = "../.."` - points the Android module to the Flutter project root (two directories up from `android/app`)
// The plugin uses this to find pubspec.yaml, .dart_tool/, build intermediates, etc.
// If you move folders around, update this path so the plugin can still invoke Flutter builds correctly
flutter {
    source = "../.."
}

/*
Android 2.3 (API level 9)       -> December 2010
Android 2.3.3 (API level 10)    -> February/July 2011
Android 3.0 (API level 11)      -> February/July 2011
Android 3.1 (API level 12)      -> May/July 2011
Android 3.2 (API level 13)      -> July 2011
Android 4.0 (API level 14)      -> October/December 2011
Android 4.0.3 (API level 15)    -> December 2011 ~ January/March 2012
Android 4.1 (API level 16)      -> June/July/October 2012
Android 4.2 (API level 17)      -> November 2012 ~ February 2013
Android 4.3 (API level 18)      -> July/August 2013
Android 4.4 (API level 19)      -> October/December 2013
Android 4.4W (API level 20)     -> June/October 2014
Android 5.0 (API level 21)      -> October/December 2014
Android 5.1 (API level 22)      -> March 2015
Android 6.0 (API level 23)      -> August/November 2015
Android 7.0 (API level 24)      -> August 2016
Android 7.1 (API level 25)      -> October/December 2016
Android 8.0 (API level 26)      -> August 2017
Android 8.1 (API level 27)      -> December 2017
Android 9 (API level 28)        -> August 2018
Android 10 (API level 29)       -> September 2019
Android 11 (API level 30)       -> September/July 2020
Android 12 (API level 31)       -> August 2021
Android 12L (API level 32)      -> March 2022
Android 13 (API level 33)       -> June 2022
Android 14 (API level 34)       -> June 2023
Android 15 (API level 35)       -> June 2024
Android 16 (API level 36)       -> March 2025

defaultConfig {
    minSdk = 23   // Android 6.0
    targetSdk = 35  // Android 15
}
android {
    compileSdk = 36 // Android 16
}

- App runs on devices with API 23+.
- Google Play sees it as optimized/tested for API 35 (required).
- You can use API 36 features at compile time, but must check device version before calling them:
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) { // API 36 codename
        // Use new Android 16 feature
    }

> minSdk = Who can install your app (backward compatibility).
> targetSdk = Google Play compliance + runtime behavior gates.
> compileSdk = Newest APIs you can use.
*/