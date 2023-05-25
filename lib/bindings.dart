import 'package:disney_plus_replica/src/shared/interfaces/i_json_service.dart';
import 'package:disney_plus_replica/src/shared/interfaces/i_movie_repository.dart';
import 'package:disney_plus_replica/src/shared/repositories/movie_repository.dart';
import 'package:disney_plus_replica/src/shared/services/json_service.dart';
import 'package:get_it/get_it.dart';

final services = GetIt.instance;

void configureServices() {
  services.registerSingleton<IJsonService>(JsonService());
  services.registerSingleton<IMovieRepository>(MovieRepository());
}

Future<void> initialiseServices() async {
  await services.get<IMovieRepository>().initialise();
}
