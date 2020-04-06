import 'package:flutter/material.dart';

class ShowModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Modal Screen"),
      ),
      body: Center(
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
        child: Text("This is Modal Screen"),
      ),
    );
  }
}