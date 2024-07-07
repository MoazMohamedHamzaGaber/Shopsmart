import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/features/layout/presentation/view/widget/bottom_nav_bar.dart';
import 'package:shopsmart_users/features/layout/presentation/view/widget/layout_view_body.dart';

import '../manage/cubit/cubit.dart';
import '../manage/cubit/states.dart';

class LayoutView extends StatelessWidget {
   const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=LayoutCubit.get(context);
        return Scaffold(
          body: LayoutViewBody(cubit: cubit,),
          bottomNavigationBar: BottomNavBar(cubit: cubit,),
        );
      },
    );
  }
}
