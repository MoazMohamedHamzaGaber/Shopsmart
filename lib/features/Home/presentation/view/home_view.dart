import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/core/utils/assets.dart';
import 'package:shopsmart_users/core/utils/components.dart';
import 'package:shopsmart_users/features/Home/presentation/view/widgets/home_view_body.dart';

import '../../../layout/presentation/manage/cubit/cubit.dart';
import '../../../layout/presentation/manage/cubit/states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return  Scaffold(
          appBar: buildAppBar(
            image: Assets.imagesShoppingCart,
            text: 'ShopSmart',
            action: true,
            delete: () {
              LayoutCubit.get(context).changeThemeMode();
            },
          ),
          body: const HomeViewBody(),
        );
      },
    );
  }
}
