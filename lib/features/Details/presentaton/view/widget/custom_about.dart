import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/utils/styles.dart';

class CustomAbout extends StatelessWidget {
  const CustomAbout({super.key, required this.category, required this.description});

  final String category;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'About this item',
                  style: AppStyles.style20.copyWith(fontSize: 18),
                ),
              ),
              const Spacer(),
              Text(
                'In $category',
                style: AppStyles.style16,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            description,
            style: AppStyles.style18,
          ),
        ),
      ],
    );
  }
}
