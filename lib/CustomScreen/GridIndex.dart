import 'package:flutter/material.dart';

class GridIndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: GridMixin(),
          )
        ],
      )
    );
  }
}

class GridMixin extends StatelessWidget {
  String img_src1 = 'https://i.pinimg.com/564x/d4/16/dc/d416dc9473e8f290a31cc31043cce3b5.jpg';
  String img_src2 = 'https://i.pinimg.com/564x/d4/16/dc/d416dc9473e8f290a31cc31043cce3b5.jpg';
  String img_src3 = 'https://i.pinimg.com/564x/d4/16/dc/d416dc9473e8f290a31cc31043cce3b5.jpg';
  String img_src4 = 'https://i.pinimg.com/564x/d4/16/dc/d416dc9473e8f290a31cc31043cce3b5.jpg';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
          slivers: section()..addAll(section())
      ),
    );
  }

  List<Widget> section() {
    return <Widget>[
      SliverList(
        delegate: SliverChildListDelegate([
          Column(
            children: <Widget>[
              Text('example', style: TextStyle(fontSize: 30.0, color: Colors.amber),),
            ],
          )
        ]),
      ),
//      SliverPadding(
//        padding: EdgeInsets.only(bottom: 30),
//      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
          childAspectRatio: 0.74,
        ),
        delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                child: FloatGridListCell(),
              );
            },
            childCount: 10
        ),
      )
    ];
  }
}

class FloatGridListCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          child: Card(
            child: Text('Text'),
            elevation: 10,
          ),
        ),
//        Container(
//          decoration: BoxDecoration(
//            boxShadow: [BoxShadow(
//              color: Colors.black45,
//              blurRadius: 10
//            )]
//          ),
//          constraints: BoxConstraints.expand(),
//          child: ClipRRect(
//            borderRadius: BorderRadius.all(Radius.circular(8)),
//            child: Image.network(
//              "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
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
        ),
      ],
    );
  }
}