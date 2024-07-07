import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/Details/presentaton/view/widget/text_title.dart';

import 'custom_about.dart';
import 'custom_buttom.dart';
import 'image_item.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.image, required this.title, required this.price, required this.category, required this.description});

  final String image;
  final String title;
  final String price;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageItem(
            image: image,
          ),
          TextTitle(
            title: title,
            price: price,
          ),
          const CustomButton(),
          CustomAbout(
            category: category,
            description: description,
          ),
        ],
      ),
    );
  }
}
