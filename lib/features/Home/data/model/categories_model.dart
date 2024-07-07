import 'package:shopsmart_users/core/utils/assets.dart';

class CategoriesModel {
  late String name;
  late String image;

  CategoriesModel({
    required this.name,
    required this.image,
  });

  static List<CategoriesModel> model = [
    CategoriesModel(
        name: 'Phones',
        image: Assets.categoriesMobiles,
    ),
    CategoriesModel(
        name: 'Laptops',
        image: Assets.categoriesPc,
    ),
    CategoriesModel(
        name: 'Electronics',
        image: Assets.categoriesElectronics),
    CategoriesModel(
        name: 'Watches',
        image: Assets.categoriesWatch),
    CategoriesModel(
        name: 'Clothes',
        image: Assets.categoriesFashion),
    CategoriesModel(
        name: 'Shoes',
        image: Assets.categoriesShoes),
    CategoriesModel(
        name: 'Books',
        image: Assets.categoriesBookImg),
    CategoriesModel(
        name: 'Cosmetics',
        image: Assets.categoriesCosmetics),
  ];
}
