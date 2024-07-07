import 'package:flutter/material.dart';
import 'package:shopsmart_users/core/utils/styles.dart';
import 'build_list_item.dart';

class LatestArrivalSection extends StatelessWidget {
  const LatestArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Latest arrival',
          style: AppStyles.style20,
        ),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height *0.16,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index)=> const BuildListItem(),
                itemCount: 10,
              ),
            ),
          ),
      ],
    );
  }
}
