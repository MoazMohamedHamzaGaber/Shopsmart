import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/features/Search/presentation/manage/cubit/states.dart';
import '../../../../../core/utils/components.dart';
import '../../manage/cubit/cubit.dart';
import 'build_GridView_Based_OnState.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              buildTextField(
                onChanged: (e) {
                  SearchCubit.get(context).searchProducts(e);
                },
                height: 80,
                context: context,
                keyboardType: TextInputType.text,
                controller: searchController,
                title: 'Search',
                prefixIcon: Icons.search_sharp,
              ),
              Expanded(child: buildGridViewBasedOnState(state)),
            ],
          ),
        );
      },
    );
  }
}