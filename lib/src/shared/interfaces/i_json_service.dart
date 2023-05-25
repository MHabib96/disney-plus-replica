import 'package:disney_plus_replica/src/shared/models/movie.dart';

abstract class IJsonService {
  Future<List<Movie>> getMovies();
}
