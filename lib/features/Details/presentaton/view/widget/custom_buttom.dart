import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/layout/presentation/manage/cubit/cubit.dart';

import '../../../../../core/utils/components.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myHeart(
            function: () {},
            size: 20,
            color: LayoutCubit.get(context).isDarkTheme
                ? Colors.white
                : Colors.black,
            backgroundColor: Colors.teal.shade200,
            circle: true,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: size.width * 0.6,
            decoration: BoxDecoration(
                color: LayoutCubit.get(context).isDarkTheme
                    ? Colors.blue
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(30)),
            child: MaterialButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Add to cart'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
