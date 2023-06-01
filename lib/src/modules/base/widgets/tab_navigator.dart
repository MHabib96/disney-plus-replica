import 'package:disney_plus_replica/src/modules/base/types/tab_type.dart';
import 'package:disney_plus_replica/src/modules/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final TabType tab;
  final GlobalKey<NavigatorState> navigatorKey;

  const TabNavigator({
    super.key,
    required this.tab,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tab) {
      case TabType.home:
        child = HomeScreen();
        break;
      case TabType.search:
        child = const Text('Search');
        break;
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
