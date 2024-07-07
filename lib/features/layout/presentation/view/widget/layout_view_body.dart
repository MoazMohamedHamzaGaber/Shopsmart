import 'package:flutter/material.dart';

import '../../manage/cubit/cubit.dart';


class LayoutViewBody extends StatelessWidget {
   const LayoutViewBody({super.key, required this.cubit});
   final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (v){
              cubit.ontroller();
            },
            controller: cubit.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: cubit.screen,
          ),
        ),
      ],
    );
  }
}
