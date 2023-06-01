import 'package:disney_plus_replica/src/modules/base/types/tab_type.dart';
import 'package:disney_plus_replica/src/shared/routing/route_handlers.dart';
import 'package:disney_plus_replica/src/shared/routing/routes.dart';
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
    String initialRoute;
    Route<dynamic> Function(RouteSettings) generateRoute;

    switch (tab) {
      case TabType.home:
        initialRoute = HomeRoutes.home.route;
        generateRoute = HomeRouteHandler.generateRoute;
        break;
      case TabType.search:
        initialRoute = HomeRoutes.home.route;
        generateRoute = HomeRouteHandler.generateRoute;
        break;
    }

    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: generateRoute,
    );
  }
}
