import 'package:flutter/material.dart';

class ShowModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Modal Screen"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ModalScreen();
                        },
                        fullscreenDialog: true
                    )
                );
              },
              child: Text("Show Modal"),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 64, left: 64),
              child: Container(
                height: 64,
                width: 64,
                child: Hero(
                  tag: 'tag',
                  child: Image.network("http://t1.gstatic.com/images?q=tbn:ANd9GcS_9ql4aU2vamO8FtoNPO8NDl2B-15FmP3wCFEc2-I4fWyTz9aJkfdD0dGh_HdVTT16iERKgelvABWEOm_RBJw"),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}

class ModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Screen"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 64, left: 64, right: 64),
              child: Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: 'tag',
                  child: Image.network("http://t1.gstatic.com/images?q=tbn:ANd9GcS_9ql4aU2vamO8FtoNPO8NDl2B-15FmP3wCFEc2-I4fWyTz9aJkfdD0dGh_HdVTT16iERKgelvABWEOm_RBJw"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("This is Modal Screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}