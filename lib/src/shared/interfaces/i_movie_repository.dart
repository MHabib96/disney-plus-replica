import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/types/category_type.dart';

abstract class IMovieRepository {
  List<Movie> getAll();
  List<Movie> getByCategory(CategoryType category);
  List<Movie> getWithHighlights();
  List<Movie> getSuggestedMovies(Movie movie, int count);
  List<Movie> getContinueWatching();
  Future<void> initialise();
}
