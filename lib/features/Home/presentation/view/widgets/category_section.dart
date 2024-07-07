import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/utils/styles.dart';
import '../../../../../core/utils/const.dart';
import '../../../../Search/presentation/view/search_view.dart';
import '../../../data/model/categories_model.dart';
import 'build_item_category.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: AppStyles.style20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(
                CategoriesModel.model.length,
                (index) {
                  return BuildItemCategory(
                    image: CategoriesModel.model[index].image,
                    name: CategoriesModel.model[index].name,
                    function: () {
                      navigateTo(
                          context,
                          SearchView(
                              title: CategoriesModel.model[index].name,
                              stream: FirebaseFirestore.instance
                                  .collection('products').where('productCategory',isEqualTo: CategoriesModel.model[index].name)
                                  .snapshots()));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
