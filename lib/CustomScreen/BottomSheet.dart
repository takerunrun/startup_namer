import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return new Container(
        height: 300.0,
        color: Colors.greenAccent,
        child: new Center(
          child: new Text("Hi BottomSheet"),
        ),
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        backgroundColor: Colors.white,
        builder: (builder) {
          return new Container(
            height: 700,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Hero(
                          tag: 'hero_tag',
                          child: Image.network(
                            "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                    )
                  ),
                )
              ],
            )
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Flutter BottomSheet"),
      ),
      body: Stack(
        children: <Widget>[
          new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: _showPersBottomSheetCallBack,
                    child: new Text("Persistent"),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                  ),
                  new RaisedButton(
                    onPressed: _showModalSheet,
                    child: new Text("Modal"),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(10,10),
                  )
                ]
              ),
              height: 200,
              width: 200,
              child: Card(
                color: Colors.blue,
                child: Center(
                  child: Text('text'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0,-10),
                      )
                    ]
                ),
                height: 64,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: LimitedBox(
                      maxHeight: 48,
                      child: Row(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              child: Hero(
                                tag: 'hero_tag',
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
                                  fit: BoxFit.cover,
                                ),
                              )
                            ),
                          ),
                          SizedBox(width: 24,),
                          Expanded(
                            child: Text(
                              'Text long text',
                              style: TextStyle(
                                  fontSize: 16
                              ),
                            ),
                          ),
                          SizedBox(width: 24,),
                          RaisedButton(
                            color: Colors.green,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ),
            )
          )
        ],
      )
    );
  }
}