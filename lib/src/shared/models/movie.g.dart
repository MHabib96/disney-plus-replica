// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'title',
      'category',
      'duration',
      'release_date',
      'rating',
      'description',
      'is_premier',
      'genres',
      'starring',
      'logoImagePath',
      'browseImagePath',
      'selectedImagePath'
    ],
  );
  return Movie(
    json['id'] as String,
    json['title'] as String,
    $enumDecode(_$CategoryTypeEnumMap, json['category']),
    json['duration'] as int,
    json['watched'] as int?,
    DateTime.parse(json['release_date'] as String),
    $enumDecode(_$RatingTypeEnumMap, json['rating']),
    json['description'] as String,
    json['is_premier'] as bool,
    (json['genres'] as List<dynamic>)
        .map((e) => $enumDecode(_$GenreTypeEnumMap, e))
        .toList(),
    (json['starring'] as List<dynamic>).map((e) => e as String).toList(),
    json['logoImagePath'] as String,
    json['browseImagePath'] as String,
    json['selectedImagePath'] as String,
    json['continueImagePath'] as String?,
    json['highlighImagePath'] as String?,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'duration': instance.duration,
      'watched': instance.watched,
      'release_date': instance.releaseDate.toIso8601String(),
      'rating': _$RatingTypeEnumMap[instance.rating]!,
      'description': instance.description,
      'is_premier': instance.isPremier,
      'genres': instance.genres.map((e) => _$GenreTypeEnumMap[e]!).toList(),
      'starring': instance.starring,
      'logoImagePath': instance.logoImagePath,
      'browseImagePath': instance.browseImagePath,
      'selectedImagePath': instance.selectedImagePath,
      'continueImagePath': instance.continueImagePath,
      'highlighImagePath': instance.highlighImagePath,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.disney: 'disney',
  CategoryType.pixar: 'pixar',
  CategoryType.marvel: 'marvel',
  CategoryType.starWars: 'starWars',
  CategoryType.nationalGeographic: 'nationalGeographic',
  CategoryType.star: 'star',
};

const _$RatingTypeEnumMap = {
  RatingType.zero: 'zero',
  RatingType.six: 'six',
  RatingType.twelve: 'twelve',
  RatingType.sixteen: 'sixteen',
};

const _$GenreTypeEnumMap = {
  GenreType.scienceFiction: 'scienceFiction',
  GenreType.fantasy: 'fantasy',
  GenreType.superHero: 'superHero',
  GenreType.actionAdventure: 'actionAdventure',
  GenreType.romance: 'romance',
  GenreType.drama: 'drama',
  GenreType.buddy: 'buddy',
  GenreType.spy: 'spy',
};
