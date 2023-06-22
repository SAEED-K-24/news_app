import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget
{

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App' ,
            ),
            actions:
            [
              IconButton(
                  onPressed: ()
                  {
                    navigatorTo(context,SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  ),
              ),

            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItems ,
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
            cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}