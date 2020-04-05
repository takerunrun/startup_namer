import 'package:flutter/material.dart';

class SheetAnimationPage extends StatefulWidget {
  @override
  _SheetAnimationPageState createState() => _SheetAnimationPageState();
}

class _SheetAnimationPageState extends State<SheetAnimationPage> {
  var _bool = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _bool = ! _bool;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0,-10),
                      )
                    ]
                ),
                height: _bool ? 64 : 600,
                duration: const Duration(milliseconds: 500),
                child: Container(),
                curve: Curves.easeInOut,
              ),
            )
          )
        ],
      )
    );
  }
}

class BottomBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheet01 extends StatelessWidget {
  final _bool = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(bottom: 64),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0,-10),
              )
            ]
        ),
        height: _bool ? 64 : 600,
        duration: const Duration(milliseconds: 500),
        child: Align(
            alignment: _bool ? Alignment.centerLeft : Alignment.topLeft,
            child: Padding(
              padding: _bool ? EdgeInsets.only(top: 8, bottom: 8, left: 8) : EdgeInsets.only(top: 24, left: 24, right: 24),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  "https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=674&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            )
        ),
        curve: Curves.easeInOut,
      ),
    );
  }
}