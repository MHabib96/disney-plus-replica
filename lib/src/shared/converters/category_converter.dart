import 'package:disney_plus_replica/src/shared/types/category_type.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryConverter implements JsonConverter<CategoryType, String> {
  const CategoryConverter();

  @override
  CategoryType fromJson(String json) {
    return CategoryType.values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(CategoryType object) {
    return object.name;
  }
}
