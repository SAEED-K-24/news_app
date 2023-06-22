import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/app_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/style/themes.dart';

void main() async {
  // بيتأكد انه كل الاسطرخلصت بعدين بيعمل runApp
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark??false));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final bool isDark ;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => NewsCubit() .. getGeneral() .. getCategory().. changeThemeMode(boolFromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
       return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light  ,
          debugShowCheckedModeBanner: false,
          home: NewsLayout(),
        );
      },
      ),
    );
  }
}