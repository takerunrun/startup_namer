import 'package:flutter/material.dart';

class FloatGridListScreen extends StatelessWidget {
  final List<String> items = ['zero', 'one', 'two', 'three', 'four'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating GridList"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(items.length, (index) {
          return FloatGridListCell(title: items[index],);
        }),
      )
    );
  }
}

class FloatGridListCell extends StatelessWidget {
  final String title;

  FloatGridListCell({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14,
            borderRadius: BorderRadius.circular(24),
            shadowColor: Colors.black38,
            child: Container(
              width: 250,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text('title'),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}