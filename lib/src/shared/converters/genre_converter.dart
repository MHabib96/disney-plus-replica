import 'package:disney_plus_replica/src/shared/types/genre_type.dart';
import 'package:json_annotation/json_annotation.dart';

class GenreConverter implements JsonConverter<GenreType, String> {
  const GenreConverter();

  @override
  GenreType fromJson(String json) {
    return GenreType.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(GenreType object) {
    return object.name;
  }
}
