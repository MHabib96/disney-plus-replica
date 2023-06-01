import 'package:disney_plus_replica/src/shared/models/movie.dart';

abstract class IMovieRepository {
  List<Movie> getAll();
  List<Movie> getWithHighlights();
  Future<void> initialise();
}
