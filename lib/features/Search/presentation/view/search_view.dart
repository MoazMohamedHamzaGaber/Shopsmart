import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/Search/presentation/view/widgets/search_view_body.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        image: Assets.imagesShoppingCart,
        text: 'Store Products',
        delete: () {},
      ),
      body: const SearchViewBody(),
    );
  }
}
