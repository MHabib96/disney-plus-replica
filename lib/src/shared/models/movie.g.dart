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
      'logo_image_path',
      'browse_image_path',
      'selected_image_path'
    ],
  );
  return Movie(
    json['id'] as String,
    json['title'] as String,
    const CategoryConverter().fromJson(json['category'] as String),
    json['duration'] as int,
    json['watched'] as int?,
    DateTime.parse(json['release_date'] as String),
    $enumDecode(_$RatingTypeEnumMap, json['rating']),
    json['description'] as String,
    json['is_premier'] as bool,
    (json['genres'] as List<dynamic>)
        .map((e) => const GenreConverter().fromJson(e as String))
        .toList(),
    (json['starring'] as List<dynamic>).map((e) => e as String).toList(),
    json['logo_image_path'] as String,
    json['browse_image_path'] as String,
    json['selected_image_path'] as String,
    json['continue_image_path'] as String?,
    json['highlight_image_path'] as String?,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': const CategoryConverter().toJson(instance.category),
      'duration': instance.duration,
      'watched': instance.watched,
      'release_date': instance.releaseDate.toIso8601String(),
      'rating': _$RatingTypeEnumMap[instance.rating]!,
      'description': instance.description,
      'is_premier': instance.isPremier,
      'genres': instance.genres.map(const GenreConverter().toJson).toList(),
      'starring': instance.starring,
      'logo_image_path': instance.logoImagePath,
      'browse_image_path': instance.browseImagePath,
      'selected_image_path': instance.selectedImagePath,
      'continue_image_path': instance.continueImagePath,
      'highlight_image_path': instance.highlightImagePath,
    };

const _$RatingTypeEnumMap = {
  RatingType.zero: 'zero',
  RatingType.six: 'six',
  RatingType.twelve: 'twelve',
  RatingType.sixteen: 'sixteen',
};
