import 'package:flutter/material.dart';

class ReturnDataHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: SelectionButton(),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Pick an option, any option'),
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen())
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                child: Text('Yep!'),
                onPressed: () {
                  // pop
                  Navigator.pop(context, 'Yep!');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                child: Text('Nope'),
                onPressed: () {
                  // pop
                  Navigator.pop(context, 'Nope');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}