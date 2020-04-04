import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:startupnamer/Cookbook/Animation/AnimatedContainer.dart';
import 'package:startupnamer/Cookbook/Animation/AnimatedOpacity.dart';
import 'package:startupnamer/Cookbook/Animation/PhysicsCard.dart';
import 'package:startupnamer/Cookbook/Animation/Transition.dart';
import 'package:startupnamer/Cookbook/Design/Drawer.dart';
import 'package:startupnamer/Cookbook/Design/Font.dart';
import 'package:startupnamer/Cookbook/Design/OrientationListApp.dart';
import 'package:startupnamer/Cookbook/Design/Snackbar.dart';
import 'package:startupnamer/Cookbook/Lists/BasicList.dart';
import 'package:startupnamer/Cookbook/Lists/FloatingAppBar.dart';
import 'package:startupnamer/Cookbook/Lists/GridList.dart';
import 'package:startupnamer/Cookbook/Lists/GridListWithHeader.dart';
import 'package:startupnamer/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'no title',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: BasicListApp(),
    );
  }
}

class HorizontalListHome extends StatelessWidget {
  final title = 'Horizontal List';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          HorizontalListViewWithHeader(),
          HorizontalListView(),
          HorizontalListView(),
        ],
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class HorizontalListViewWithHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("map"),
            ),
            HorizontalListView(),
          ],
        ),
    );
  }
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              HorizontalListView(),
            ],
          ),
        ),
      ),
    );
  }
}

