import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom'),
      ),
      body: CustomGridList(),
    );
  }
}

class CustomGridList extends StatelessWidget {
  final List<String> items = ['zero', 'one', 'two', 'three', 'four', 'one', 'two', 'three', 'four'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(items.length, (index) {
        return CustomGridListCell();
      }),
    );
  }
}

class CustomGridListCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              child: Container(
                color: Colors.black38,
                width: 22,
                height: 22,
                child: Image.asset(
                  'images/lock.png',
                  width: 12,
                  height: 12,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            ),
            child: Container(
              color: Colors.black38.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'Placess',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Container(
              height: double.infinity,
              color: Colors.black38.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          child: Text(
            'title title',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
        )
      ],
    );
  }
}