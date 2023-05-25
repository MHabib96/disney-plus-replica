import 'package:disney_plus_replica/bindings.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_json_service.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';

class MovieRepository implements IMovieRepository {
  List<Movie> _movies = [];

  @override
  Future<void> initialise() async {
    if (_movies.isNotEmpty) _movies.clear();
    _movies = await services.get<IJsonService>().getMovies();
  }
}
