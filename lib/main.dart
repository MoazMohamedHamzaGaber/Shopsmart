import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/core/utils/shared_preference.dart';
import 'package:shopsmart_users/features/layout/presentation/manage/cubit/cubit.dart';
import 'package:shopsmart_users/features/layout/presentation/manage/cubit/states.dart';
import 'package:shopsmart_users/features/layout/presentation/view/layout_view.dart';

import 'core/utils/theme_data.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final isDarkTheme = await SharedPreference.getData(key: 'Theme') ?? false;
  runApp( MyApp(isDarkTheme: isDarkTheme,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDarkTheme});
  final bool isDarkTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>LayoutCubit(isDarkTheme),)
      ],
      child: BlocBuilder<LayoutCubit,LayoutStates>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ShopSmart',
            theme: Styles.themeData(isDarkTheme: LayoutCubit.get(context).isDarkTheme, context: context),
            home: const LayoutView(),
          );
        },
      ),
    );
  }
}