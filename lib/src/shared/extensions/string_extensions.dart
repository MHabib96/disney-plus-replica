import 'package:disney_plus_replica/src/shared/routing/routes.dart';

extension StringExtensions on String {
  T toRouteEnum<T extends RouteEnum>(List<T> values) {
    return values.firstWhere(
      (x) => x.route == this,
      orElse: () => throw Exception('No Enum value found for $this'),
    );
  }
}
