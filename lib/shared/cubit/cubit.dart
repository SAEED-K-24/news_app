import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/modules/homenews.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/category.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),

  ];

  List<Widget> screens =
  [
    HomeNews(),
    Category(),
    Settings(),
  ];

  List<dynamic> general = [];

  void getGeneral ()
  {
    emit(NewsGetHomeLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'us',
      'apiKey':'383892f99a2e4b3abc6fcb4fb13d43a8',
    },).then((value)
    {
    general = value.data['articles'];
    emit(NewsGetHomeSuccessState());
    print(general[0]['title']);
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetHomeErrorState(error.toString()));
    });
  }

  List<dynamic> category = [];

  void getCategory ()
  {
    if (category.length == 0) {
      emit(NewsGetCategoryLoadingState());

      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'us',
        'category':'sports',
        'apiKey':'383892f99a2e4b3abc6fcb4fb13d43a8',
      },).then((value)
      {
        category = value.data['articles'];
        emit(NewsGetCategorySuccessState());
        print(category[0]['title']);
      }).catchError((error)
      {
        print(error.toString());
        emit(NewsGetCategoryErrorState(error.toString()));
      });
    } else {
      emit(NewsGetCategorySuccessState());
    }

  }

  List<dynamic> search = [];

  void getSearch (String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
      'q':'$value',
      'apiKey':'383892f99a2e4b3abc6fcb4fb13d43a8',
    },
    ).then((value)
    {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
      print(search[0]['title']);
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }


  void changeBottomNavBar (int index)
  {
    currentIndex = index ;
    if (index == 1)
      getCategory();

    emit(NewsBottomNavBar());
  }

  bool isDark = false ;

  void changeThemeMode ({bool? boolFromShared})
  {
    //isDark = false ;
    if (boolFromShared != null) {
      isDark = boolFromShared;
      emit(NewsChangeThemeModeState());
    }

    else {
      isDark = !isDark ;
      CacheHelper.setData(key: 'isDark', value: isDark).then((value)
      {
        String m = isDark ? 'Mode is dark' : 'Mode is light' ;
        Fluttertoast.showToast(
            msg: "$m",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        emit(NewsChangeThemeModeState());
      });
    }


  }
}