abstract class RouteEnum {
  final String route;

  RouteEnum(this.route);
}

enum HomeRoutes implements RouteEnum {
  home('home'),
  movie('/movie');

  @override
  final String route;

  const HomeRoutes(this.route);
}
