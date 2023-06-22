import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';

Widget defaultButton ({
  // if they are a width is a common use we put it like intiliaze
  double width = double.infinity ,
  Color color = Colors.blue ,
  bool isUpperCase = true ,
  double radius = 0.0 ,
  required Function function  ,
  required String text ,

}) => Container(
  width: width,
  child: MaterialButton
    (
    onPressed:(){
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
  ),
);

Widget defaultTextFormField ({
  required TextEditingController controller ,
  required TextInputType type ,
  required String label ,
  required IconData prefix ,
  required Function validate ,
  bool isPassword = false ,
  IconData? suffix ,
  VoidCallback? onSubmit ,
  Function? onChange ,
  Function? suffixPressed ,
  VoidCallback? onTap ,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: (value) => onSubmit,
  onChanged:(value) => onChange!(value),
  obscureText:isPassword,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: IconButton(
      icon:Icon(suffix),
      onPressed:(){
        suffixPressed!();
      } ,
    ),
    border: OutlineInputBorder(),

  ),
  validator: (value) => validate(value),
  onTap: () => onTap!(),
);

Widget buildNewsItem (list , context) => InkWell(
  onTap: ()
  {
    navigatorTo(context, WebViewScreen(list['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children:

      [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(

              image: NetworkImage('${list['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text(

                    '${list['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                SizedBox(

                  height: 4,),

                Text(

                  '${list['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
/*
* list.length > 0 ? ListView.separated
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
) : isSearch ? Container() : Center(child: CircularProgressIndicator())*/
Widget listItem (list , context,{isSearch = false}) => list.length > 0 ? ListView.separated
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
) : isSearch ? Container() : Center(child: CircularProgressIndicator());

void navigatorTo (context,widget) => Navigator.push(
  context,
MaterialPageRoute(
  builder:(context) => widget ,
),
);
