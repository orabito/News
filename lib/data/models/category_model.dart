
import 'dart:ui';

import 'package:news_application/core/assets_manager.dart';
import 'package:news_application/core/strings_manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;
  TextDirection textDirection;
  CategoryModel({
     this.textDirection=TextDirection.ltr,
    required this.id,
    required this.title,
    required this.imagePath,
});
static List<CategoryModel>categories=[
CategoryModel(id: "general", title: StringsManager.general,
    imagePath: AssetsManager.general),
  CategoryModel(
    id: "business",
    title: StringsManager.business,
    imagePath: AssetsManager.business,
    textDirection: TextDirection.rtl
  ),
  CategoryModel(
    id: "sports",
    title: StringsManager.sports,
    imagePath: AssetsManager.sports,
  ),
  CategoryModel(
    id: "technology",
    title: StringsManager.technology,
    imagePath: AssetsManager.technology,
      textDirection: TextDirection.rtl
  ),
  CategoryModel(
    id: "entertainment",
    title: StringsManager.entertainment,
    imagePath: AssetsManager.entertainment,

  ),
  CategoryModel(
    id: "health",
    title: StringsManager.health,
    imagePath: AssetsManager.health,
      textDirection: TextDirection.rtl
  ),
  CategoryModel(

    id: "science",
    title: StringsManager.science,
    imagePath: AssetsManager.science,
  ),




];
}