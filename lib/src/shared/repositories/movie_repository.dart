import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/shared/extensions/iterable_extensions.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_json_service.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:disney_plus_replica/src/shared/types/category_type.dart';

class MovieRepository implements IMovieRepository {
  List<Movie> _movies = [];

  @override
  List<Movie> getAll() => _movies;

  @override
  List<Movie> getByCategory(CategoryType category) =>
      _movies.where((movie) => movie.category == category).toList();

  @override
  List<Movie> getWithHighlights() =>
      _movies.where((movie) => movie.highlightImagePath != null).toList();

  @override
  List<Movie> getSuggestedMovies(Movie movie, int count) {
    var mutualMovies = getByCategory(movie.category);
    mutualMovies.removeWhere((x) => x.id == movie.id);

    List<(Movie, int)> mutualMoviesWithScore = [];

    //Assign score to movie based on mutual actors.
    for (var mutualMovie in mutualMovies) {
      int score = 0;
      for (var actor in mutualMovie.starring) {
        if (movie.starring.contains(actor)) {
          score++;
        }
      }
      mutualMoviesWithScore.add((mutualMovie, score));
    }

    return mutualMoviesWithScore.map((e) => e.$1).takeUpTo(count).toList();
  }

  @override
  Future<void> initialise() async {
    if (_movies.isNotEmpty) _movies.clear();
    _movies = await services.get<IJsonService>().getMovies();
  }
}
