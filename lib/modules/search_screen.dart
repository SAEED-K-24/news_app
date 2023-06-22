import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (BuildContext context,state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search,
                  onChange:(value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  } ,
                  validate: (String value)
                  {
                    if (value.isEmpty)
                      return 'search must not be empty';
                    return null ;
                  },
                ),
              ),
              Expanded(child: listItem(list, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}