import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alice/alice.dart';
import 'network_managers.dart';

/// Helper class to easily access Alice HTTP inspector throughout the app
class AliceHelper {
  static NetworkManagers get _networkManager => Get.find<NetworkManagers>();

  /// Static navigator key for Alice
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  /// Get Alice instance
  static Alice get alice => _networkManager.getAlice();

  /// Show Alice inspector manually
  static void showInspector() {
    _networkManager.showAliceInspector();
  }

  /// Get Alice navigator key for integration with app navigation
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
