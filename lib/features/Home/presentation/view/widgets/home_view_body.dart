import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/Home/presentation/view/widgets/category_section.dart';
import 'package:shopsmart_users/features/Home/presentation/view/widgets/latest_arrival_section.dart';
import 'package:shopsmart_users/features/Home/presentation/view/widgets/swiper_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwiperWidget(),
            SizedBox(height: 20,),
            LatestArrivalSection(),
            CategorySection(),
          ],
        ),
      ),
    );
  }
}
