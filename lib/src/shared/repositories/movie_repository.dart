import 'package:disney_plus_replica/bindings.dart';
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
  Future<void> initialise() async {
    if (_movies.isNotEmpty) _movies.clear();
    _movies = await services.get<IJsonService>().getMovies();
  }
}
