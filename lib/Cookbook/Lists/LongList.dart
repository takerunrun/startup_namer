import 'package:flutter/material.dart';

class LongListItemBuilder {
  List<String> items() {
    return List<String>.generate(10000, (i) => 'Item $i');
  }
}

class LongListApp extends StatelessWidget {
  final List<String> items;

  LongListApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Long List"),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          }
      ),
    );
  }
}