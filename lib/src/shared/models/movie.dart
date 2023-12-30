import 'package:disney_plus_replica/src/shared/converters/category_converter.dart';
import 'package:disney_plus_replica/src/shared/converters/genre_converter.dart';
import 'package:disney_plus_replica/src/shared/types/category_type.dart';
import 'package:disney_plus_replica/src/shared/types/genre_type.dart';
import 'package:disney_plus_replica/src/shared/types/rating_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

//@JsonSerializable()
//@CategoryConverter()
//@GenreConverter()
class Movie {
  Movie(
    this.id,
    this.title,
    this.category,
    this.duration,
    this.watched,
    this.releaseDate,
    this.rating,
    this.description,
    this.isPremier,
    this.genres,
    this.starring,
    this.logoImagePath,
    this.browseImagePath,
    this.selectedImagePath,
    this.continueImagePath,
    this.highlightImagePath,
  );

  @JsonKey(required: true)
  final String id;

  @JsonKey(required: true)
  final String title;

  @JsonKey(required: true)
  final CategoryType category;

  @JsonKey(required: true)
  final int duration;

  @JsonKey(required: true)
  final int watched;

  @JsonKey(required: true, name: 'release_date')
  final DateTime releaseDate;

  @JsonKey(required: true)
  final RatingType rating;

  @JsonKey(required: true)
  final String description;

  @JsonKey(required: true, name: 'is_premier')
  final bool isPremier;

  @JsonKey(required: true)
  final List<GenreType> genres;

  @JsonKey(required: true)
  final List<String> starring;

  @JsonKey(required: true, name: 'logo_image_path')
  final String logoImagePath;

  @JsonKey(required: true, name: 'browse_image_path')
  final String browseImagePath;

  @JsonKey(required: true, name: 'selected_image_path')
  final String selectedImagePath;

  @JsonKey(name: 'continue_image_path')
  final String? continueImagePath;

  @JsonKey(name: 'highlight_image_path')
  final String? highlightImagePath;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
