import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  final String title;

  DrawerApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Drawer App')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                print("tapped item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                print("tapped item 2");
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}