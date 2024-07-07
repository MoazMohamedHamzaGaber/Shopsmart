import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/core/error/failure.dart';
import 'package:shopsmart_users/core/utils/styles.dart';
import 'package:shopsmart_users/features/Search/presentation/manage/cubit/cubit.dart';
import 'package:shopsmart_users/features/Search/presentation/manage/cubit/states.dart';
import 'build_list_item.dart';

class LatestArrivalSection extends StatelessWidget {
  const LatestArrivalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit,SearchStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Latest arrival',
              style: AppStyles.style20,
            ),
            if(state is AllProductsSuccessStates)
            state.products.isEmpty? Center(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('No Found Products',
                style: AppStyles.style20.copyWith(color: Colors.grey),
              ),
            )):StreamBuilder(
              stream: FirebaseFirestore.instance.collection('products').orderBy('createdAt',descending: true).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.hasError){
                  return  Text('${FirebaseFailure.hasInternetConnection()}');
                }else if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height *0.16,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index)=> BuildListItem(model: state.products[index]),
                        itemCount: state.products.length <10 ? state.products.length:10,
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        );
      },
    );
  }
}
