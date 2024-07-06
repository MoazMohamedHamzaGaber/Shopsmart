import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/features/layout/presentation/manage/cubit/states.dart';

import '../../../../home/presentation/view/home_view.dart';


class LayoutCubit extends Cubit<LayoutStates>
{
  LayoutCubit():super(LayoutInitialStates());
  static LayoutCubit get(context)=>BlocProvider.of(context);


  int currentIndex=0;

  void changeBottomNav(index)
  {
    currentIndex=index;
    emit(LayoutChangeBottomNavStates());
  }

  var controller=PageController();

   ontroller(){
   controller= PageController(initialPage: currentIndex);
    emit(LayoutControllerStates());
  }
  List<Widget>screen=[
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
    //  SearchView(title: 'Store Products',stream: FirebaseFirestore.instance.collection('products').snapshots()),
    //  CartView(),
    // const ProfileView(),
  ];

}