import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class HomeNews extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          var list = NewsCubit.get(context).general;
          return state is! NewsGetHomeLoadingState ? ListView.separated
            (
              physics:BouncingScrollPhysics(),
              itemBuilder: (context , index) => buildNewsItem(list[index],context),
              separatorBuilder: (context ,index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
                margin: EdgeInsetsDirectional.only(
                  start: 20,
                ),
              ),
              itemCount: list.length ,
          ) : Center(child: CircularProgressIndicator());
        },

    );
  }
}