import 'package:flutter/material.dart';

class BuildItemCategory extends StatelessWidget {
  const BuildItemCategory({super.key, required this.image, required this.name, required this.function,});

  final String image;
  final String name;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Column(
        children: [
          Image.asset(image,width: 50),
          const SizedBox(
            height: 5,
          ),
           Text(name),
        ],
      ),
    );
  }
}
