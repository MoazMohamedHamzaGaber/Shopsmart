import 'package:flutter/material.dart';
import 'package:shopsmart_users/features/Search/presentation/view/widgets/search_view_body.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.stream, required this.title});
  final stream;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        image: Assets.imagesShoppingCart,
        text: title,
        delete: () {},
      ),
      body:  SearchViewBody(stream: stream,),
    );
  }
}
