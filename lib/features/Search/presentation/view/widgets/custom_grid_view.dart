import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/utils/components.dart';
import '../../../data/model/product_model.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.stream});

  final stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        final products = snapshot.data!.docs.map((doc) {
          return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10,
          ),
          child: DynamicHeightGridView(
            physics: const BouncingScrollPhysics(),
            builder: (context, index) => buildItem(
              context,
              products[index],
            ),
            itemCount: products.length,
            crossAxisCount: 2,
          ),
        );
      },
    );
  }
}
