import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() {
//  return runApp(MyApp());
//}

class SliverPaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey[100],
        statusBarColor: Colors.indigo,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Flutter Grids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ExamplesPage(),
    );
  }
}

class ExamplesPage extends StatelessWidget {
  final String title = 'Flutter GridView Padding Examples';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Container(
              width: 410,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('ISSUE - WEB Shadows',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('This page shows some issues with shadows on WEB, they '
                      'spread out way too much compared to same shadow on a device.'),
                  RaisedButton(
                    child: Text('Flutter Web shadows issue'),
                    onPressed: () => ShadowsIssuePage.show(context,
                        title: 'Shadows WEB issue'),
                  ),
                  SizedBox(height: 20),
                  Text('EXAMPLE 1 - Simple grid padding case',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Padding on GridView builder is simple, it has a standard '
                          'padding property, just use it.'),
                  RaisedButton(
                    child: Text('Padding on Gridview builder'),
                    onPressed: () => GridViewBuilderPage.show(context,
                        title: 'Padding a GridView builder'),
                  ),
                  SizedBox(height: 20),
                  Text('EXAMPLE 2 - Padding on SliverGrid',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Padding on SliverGrid is tricker, wrapping entire CustomScrollView '
                          'with padding FAILS, it will cover shadows!'),
                  RaisedButton(
                    child: Text('Padding Slivers and SliverGrid'),
                    onPressed: () => SliverGridFailPage.show(context,
                        title: 'Padding a CustomScrollView and SliverGrid'),
                  ),
                  SizedBox(height: 20),
                  Text('EXAMPLE 3 - Padding SliverGrid with SliverPadding',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Padding on SliverGrid is tricker, use SliverPadding!'),
                  RaisedButton(
                    child: Text('Padding Slivers and SliverGrid'),
                    onPressed: () => SliverGridPage.show(context,
                        title: 'Padding a CustomScrollView and SliverGrid'),
                  ),
                  SizedBox(height: 20),
                  Text('EXAMPLE 4 - SliverGrid fancy pants',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Padding a SliverGrid works on extend behind '
                      'AppBar and fancy transparent gradient AppBar too'),
                  RaisedButton(
                    child: Text('Padding fancy Slivers and SliverGrid'),
                    onPressed: () => SliverGridExtPage.show(context,
                        title: 'Padding a CustomScrollView and SliverGrid'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

// *****************************************************************************

class GridItem extends StatelessWidget {
  const GridItem({Key key, this.title, this.color, this.height, this.bodyText})
      : super(key: key);

  final String title;
  final Color color;
  final double height;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          if (height != null && height > 0) SizedBox(height: height),
          if (height != null && height > 0)
            Text(bodyText,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// *****************************************************************************

class ShadowsIssuePage extends StatelessWidget {
  const ShadowsIssuePage({Key key, this.title}) : super(key: key);
  final String title;

  static Future<void> show(BuildContext context, {String title}) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ShadowsIssuePage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 50),
          child: Column(
            children: <Widget>[
              Text('Shadows on Web look incorrect',
                  style: TextStyle(fontSize: 25)),
              SizedBox(height: 10),
              Text('Shadows bleed too much compared to device rendering',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: Colors.indigo[100],
                child: Container(
                  child: Center(child: Text('Material Card with elevation 0')),
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(0),
                color: Colors.indigo[100],
                child: Container(
                  child: Center(child: Text('Material Card with elevation 5')),
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 10,
                margin: EdgeInsets.all(0),
                color: Colors.indigo[100],
                child: Container(
                  child: Center(child: Text('Material Card with elevation 10')),
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.7),
                      offset: Offset(3, 4),
                      blurRadius: 6,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.indigo[100],
                  ),
                  child: Center(child: Text('Container with custom BoxShadow')),
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              SelectableText(
                  'The fonts on WEB are also fuzzier, like too much antialias'),
              SelectableText(
                  'The shadow issue is reported here: https://github.com/flutter/flutter/issues/32215 '),
            ],
          ),
        ),
      ),
    );
  }
}

// *****************************************************************************

class GridViewBuilderPage extends StatelessWidget {
  const GridViewBuilderPage({Key key, this.title}) : super(key: key);
  final String title;

  static Future<void> show(BuildContext context, {String title}) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GridViewBuilderPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    var _gridItems = List<GridItem>.generate(400, (index) {
      return GridItem(
          title: 'Tile nr ${index + 1}',
          color: Colors.primaries[index % Colors.primaries.length][800]);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Scrollbar(
        child: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2,
          ),
          itemCount: _gridItems.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            child: _gridItems[index],
          ),
        ),
      ),
    );
  }
}

// *****************************************************************************

class SliverGridFailPage extends StatelessWidget {
  const SliverGridFailPage({Key key, this.title}) : super(key: key);
  final String title;

  static Future<void> show(BuildContext context, {String title}) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SliverGridFailPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    var _gridItems = List<GridItem>.generate(400, (index) {
      return GridItem(
          title: 'Tile nr ${index + 1}',
          color: Colors.primaries[index % Colors.primaries.length][800]);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  Text(
                    'SliverGrid FAILED Padding',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text('Texts and header in own SliverList so that we can '
                      'scroll them with the scrolling grid. If we WRAP the '
                      'CustomScrollView in a Padding, the result is uggly = FAIL! '
                      'The ELEVATION shadows will be covered by the padding!'),
                  SizedBox(height: 20),
                ]),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                    return Card(
                      elevation: 6,
                      child: _gridItems[index],
                    );
                  },
                  childCount: _gridItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// *****************************************************************************

class SliverGridPage extends StatelessWidget {
  const SliverGridPage({Key key, this.title}) : super(key: key);
  final String title;

  static Future<void> show(BuildContext context, {String title}) async {
    await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SliverGridPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    var _gridItems = List<GridItem>.generate(400, (index) {
      return GridItem(
          title: 'Tile nr ${index + 1}',
          color: Colors.primaries[index % Colors.primaries.length][800]);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  Text(
                    'SliverGrid OK Padding',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text('Texts and header in own SliverList so that we can '
                      'scroll them with the scrolling grid. To get the '
                      'Padding effect, we must wrap each Sliver in a '
                      'SliverPadding!'),
                  SizedBox(height: 20),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                    return Card(
                      elevation: 6,
                      child: _gridItems[index],
                    );
                  },
                  childCount: _gridItems.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// *****************************************************************************

class SliverGridExtPage extends StatelessWidget {
  const SliverGridExtPage({Key key, this.title}) : super(key: key);
  final String title;

  static Future<void> show(BuildContext context, {String title}) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SliverGridExtPage(title: title)));
  }

  @override
  Widget build(BuildContext context) {
    var _gridItems = List<GridItem>.generate(400, (index) {
      return GridItem(
          title: 'Tile nr ${index + 1}',
          color: Colors.primaries[index % Colors.primaries.length][800]);
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Colors.indigo,
                Colors.indigo.withOpacity(0.6),
              ],
            ),
          ),
          child: null,
        ),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20 + kToolbarHeight),
                  Text(
                    'SliverGrid OK Padding',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Text('Texts and header in own SliverList so that we can '
                      'scroll them with the scrolling grid. Here with scroll '
                      'behind a fancy gradient transparent AppBar!'),
                  Text('SliverPadding also works with package '
                      'StaggaredGrid and its SliverStaggaredGrid but that cannot be '
                      'shown in DartPad, but here is an another example using it: '),
                  SelectableText(
                      'https://gist.github.com/rydmike/5997737351268ad08e35e9f406e73f39'),
                  SizedBox(height: 20),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                    return Card(
                      elevation: 6,
                      child: _gridItems[index],
                    );
                  },
                  childCount: _gridItems.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
