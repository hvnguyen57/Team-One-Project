import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void popUntilNameMatches(String routeName) {
    navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
