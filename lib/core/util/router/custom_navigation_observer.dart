import 'dart:async';

import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final StreamController<String> _navigationStreamController =
      StreamController<String>.broadcast();

  Stream<String> get navigationStream => _navigationStreamController.stream;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStreamController.add('pop');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _navigationStreamController.add('push');
  }

  void dispose() {
    _navigationStreamController.close();
  }
}
