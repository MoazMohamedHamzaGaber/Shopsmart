import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../manage/cubit/cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.cubit});
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: cubit.currentIndex,
      height: 70,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      onDestinationSelected: (value){
        cubit.currentIndex=value;
        cubit.controller.jumpToPage(cubit.currentIndex);
      },
      destinations:  const [
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.home),
          icon: Icon(IconlyLight.home),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.search),
          icon: Icon(IconlyLight.search),
          label: 'Search',
        ),
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.bag2),
          icon: Badge(
              label:Text('0'),
              child: Icon(IconlyLight.bag2)),
          label: 'Cart',
        ),
        NavigationDestination(
          selectedIcon: Icon(IconlyBold.profile),
          icon: Icon(IconlyLight.profile),
          label: 'Profile',
        ),
      ],
    );
  }
}
