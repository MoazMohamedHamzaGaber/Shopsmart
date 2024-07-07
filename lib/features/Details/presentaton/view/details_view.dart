import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/utils/components.dart';
import 'widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.image, required this.title, required this.price, required this.category, required this.description});

  final String image;
  final String title;
  final String price;
  final String category;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        text: 'ShopSmart',
        centerTitle: true,
        iconData: IconlyLight.bag2,
      ),
      body: DetailsViewBody(
        image: image,
        title: title,
        price: price,
        category: category,
        description: description,
      ),
    );
  }
}
