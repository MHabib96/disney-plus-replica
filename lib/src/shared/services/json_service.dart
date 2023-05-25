import 'dart:convert';

import 'package:disney_plus_replica/src/shared/interfaces/i_json_service.dart';
import 'package:disney_plus_replica/src/shared/models/movie.dart';
import 'package:flutter/services.dart';

class JsonService implements IJsonService {
  @override
  Future<List<Movie>> getMovies() async {
    final jsonString = await rootBundle.loadString('assets/json/movies.json');
    final jsonMap = await json.decode(jsonString);
    List<Movie> output = [];
    for (var movie in jsonMap['movies']) {
      output.add(Movie.fromJson(movie));
    }
    return output;
  }
}
