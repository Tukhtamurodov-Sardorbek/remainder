import 'package:firebase_core/firebase_core.dart';

final class AppFirebase {
  const AppFirebase._();

  static AppFirebase? _instance;

  static AppFirebase get ref => _instance ??= AppFirebase._();

  Future<void> init() => Firebase.initializeApp();
}
