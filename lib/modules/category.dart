import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/style/themes.dart';

class Category extends StatefulWidget
{
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {


  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    // TODO: implement build
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).category;
        return list.length > 0 ? Stack(
         children:
         [
           ListView.separated(
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
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: FloatingActionButton(onPressed: ()
             {
               showDialog(context: context, builder: (context)
               {
                 return AlertDialog(
                   backgroundColor: cubit.isDark ? HexColor('333739') : Colors.white,
                   title: Text('Country && Category',style: Theme.of(context).textTheme.bodyText1,),
                   actions:
                   [
                     Center(
                       child: InkWell(
                         onTap: (){},
                         child: Container(
                           padding: EdgeInsets.all(8),
                           child: Text('COUNTRY',
                             style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.grey ,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Container(
                       width: double.infinity,
                       height: 1,
                       color: Colors.grey,
                       margin: EdgeInsetsDirectional.only(
                         start: 20,
                       ),
                     ),
                     SizedBox(height: 10,),
                     Center(
                       child: InkWell(
                         onTap: (){},
                         child: Container(
                           padding: EdgeInsets.all(8),
                           child: Text('CATEGORY',
                             style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color:  Colors.grey ,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Container(
                       width: double.infinity,
                       height: 1,
                       color: Colors.grey,
                       margin: EdgeInsetsDirectional.only(
                         start: 20,
                       ),
                     ),
                   ],
                 );
               });
             },
               child: Icon(Icons.menu),),
           )
         ],
          alignment: AlignmentDirectional.bottomEnd,
        ) : Center(child: CircularProgressIndicator());
      },

    );
  }


}

/*
*  List<dynamic> country = ['ae','ar','at','au', 'be','bg','br','ca',
    'ch','cn','co','cu','cz','de','eg','fr',
    'gb','gr','hk','hu','id','ie', 'il','in',
    'it','jp','kr','lt','lv','ma','mx','my',
    'ng','nl','no','nz','ph','pl','pt','ro',
    'rs','ru','sa','se','sg','si','sk','th',
    'tr','tw','ua','us','ve','za',
  ];*/