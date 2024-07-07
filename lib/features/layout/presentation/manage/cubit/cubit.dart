import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/features/Search/presentation/view/search_view.dart';
import 'package:shopsmart_users/features/layout/presentation/manage/cubit/states.dart';

import '../../../../../core/utils/shared_preference.dart';
import '../../../../home/presentation/view/home_view.dart';


class LayoutCubit extends Cubit<LayoutStates>
{
  LayoutCubit(bool initialTheme):super(LayoutInitialStates()){
    isDarkTheme = initialTheme;
  }
  static LayoutCubit get(context)=>BlocProvider.of(context);


  bool isDarkTheme = false;

  void changeThemeMode() async {
    isDarkTheme = !isDarkTheme;
    await SharedPreference.saveData(key: 'Theme', value: isDarkTheme);
    emit(ChangeThemeModeStates());
  }


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
    const SearchView(),
    const HomeView(),
    const HomeView(),
    //  SearchView(title: 'Store Products',stream: FirebaseFirestore.instance.collection('products').snapshots()),
    //  CartView(),
    // const ProfileView(),
  ];

}