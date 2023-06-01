import 'package:disney_plus_replica/src/modules/home/screens/home_screen.dart';
import 'package:disney_plus_replica/src/modules/movie/screens/movie_screen.dart';
import 'package:disney_plus_replica/src/modules/movie/view_models/movie_view_model.dart';
import 'package:disney_plus_replica/src/shared/extensions/string_extensions.dart';
import 'package:disney_plus_replica/src/shared/routing/routes.dart';
import 'package:flutter/material.dart';

class HomeRouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var route = settings.name?.toRouteEnum<HomeRoutes>(HomeRoutes.values);
    var viewModel = settings.arguments;
    switch (route) {
      case HomeRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case HomeRoutes.movie:
        if (viewModel is! MovieViewModel) continue error;
        return MaterialPageRoute(builder: (_) => MovieScreen(viewModel: viewModel));
      error:
      default:
        return _errorRoute<HomeRoutes>(route);
    }
  }
}

Route<dynamic> _errorRoute<T extends RouteEnum>(T? route) {
  return MaterialPageRoute(
    builder: (_) => Center(
      child: Text('No route defined for $route'),
    ),
  );
}
