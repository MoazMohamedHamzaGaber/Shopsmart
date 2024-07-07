import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/utils/styles.dart';


class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.title, required this.price});

  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 20,
            child: Text(
              title,
              //maxLines: 2,
              //overflow: TextOverflow.ellipsis,
              style: AppStyles.style20,
            ),
          ),
          const Spacer(),
           Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
