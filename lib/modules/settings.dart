import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';

class Settings extends StatefulWidget
{
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: <Widget>[
                  Text("Select Language",
                      style: Theme.of(context).textTheme.bodyText1),
                  Spacer(),
                  Text("English, US",
                      style: TextStyle(color: Colors.blue, fontSize: 15.0)),
                  Container(width: 10)
                ],
              ),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {
             /* setState(() {
                isSwitched1 = !isSwitched1;
                if (isSwitched1) {
                  DynamicTheme.of(context)!.setTheme(AppThemes.Dark);
                } else {
                  DynamicTheme.of(context)!.setTheme(AppThemes.LightBlue);
                }
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text("Dark Mode",
                          style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Spacer(),
                    Switch(
                        value: cubit.isDark,
                        onChanged: (value){
                              cubit.changeThemeMode();
                              setState(() {

                              });
                        },
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.grey,
                    ),
                    ],
                  ),
                  Text(
                      'The design reduces the light emitted by device screens while maintaining the minimum color contrast ratios required for readability.',
                      style: Theme.of(context).textTheme.bodyText1),
                  Container(height: 15)
                ],
              ),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {
              /*setState(() {
                isSwitched2 = !isSwitched2;
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("App Sound",
                          style:Theme.of(context).textTheme.bodyText1),
                      Spacer(),
                      Switch(
                        value: false,
                        onChanged: (value) {
                          /*setState(() {
                            isSwitched2 = value;
                          });*/
                        },
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey,
                      )
                    ],
                  ),
                  Text(
                      "Sound Effects during using the app, like tap sound etc. ",
                      style: Theme.of(context).textTheme.bodyText1, ),
                  Container(height: 15)
                ],
              ),
            ),
          ),
          Divider(height: 0),
          Container(height: 25),
          Container(
            child: Text("Push Notification",
                style: Theme.of(context).textTheme.bodyText1),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          InkWell(
            onTap: () {
             /* setState(() {
                isSwitched3 = !isSwitched3;
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text("Recommended photos",
                      style:Theme.of(context).textTheme.bodyText1),
                  Spacer(),
                  Switch(
                    value: false,
                    onChanged: (value) {
                     /* setState(() {
                        isSwitched3 = value;
                      });*/
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {
             /* setState(() {
                isSwitched4 = !isSwitched4;
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text("Recommended collections",
                      style: Theme.of(context).textTheme.bodyText1),
                  Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {
                     /* setState(() {
                        isSwitched4 = value;
                      });*/
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {
             /* setState(() {
                isSwitched5 = !isSwitched5;
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text("New feautres",
                      style: Theme.of(context).textTheme.bodyText1),
                  Spacer(),
                  Switch(
                    value: false,
                    onChanged: (value) {
                     /* setState(() {
                        isSwitched5 = value;
                      });*/
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {
             /* setState(() {
                isSwitched6 = !isSwitched6;
              });*/
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text("New updates",
                      style: Theme.of(context).textTheme.bodyText1),
                  Spacer(),
                  Switch(
                    value: false,
                    onChanged: (value) {
                      /*setState(() {
                        isSwitched6 = value;
                      });*/
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          Divider(height: 0),
          Container(height: 25),
          Container(
            child: Text("More",
                style: Theme.of(context).textTheme.bodyText1),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text("Ask a Question",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text("F A Q",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Divider(height: 0),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text("Privacy Policy",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Divider(height: 0),
          Container(height: 15),
        ],
      ),
    );
  }
}