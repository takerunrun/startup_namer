import 'package:flutter/material.dart';
import 'package:startupnamer/Header.dart';

class FullscreenAppWithoutAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we won't use appBar here
      // appBar: AppBar(
      //   title: Text("Full screen page"),
      //   backgroundColor: Colors.purple,
      // ),
      // might need to set this flag,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text('mrflutter.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FullscreenAppWithAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'mrflutter.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Positioned(
            child: AppBar(
              title: Text("Transparent AppBar"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  tooltip: 'Share',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          children: <Widget>[
            Header()
          ],
        ),
      ),
    );
  }
}