import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            "Explore",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.blue
            ),
          ),
        ),
        ExploreProductList(),
      ],
    );
  }
}

class ExploreProductList extends StatefulWidget {
  @override
  _ExploreProductListState createState() => _ExploreProductListState();
}

class _ExploreProductListState extends State<ExploreProductList> {
  ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scrollToStart(ScrollController controller) {
    if (controller.hasClients) {
      controller.animateTo(
        0,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 200),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
//    final AppStore store = Provider.of(context);
//    return Observer(
//        name: "Explore Products Observer",
//        builder: (context) {
//          scrollToStart(controller);
//          return SizedBox(
//            height: 250,
//            child: ListView(
//              padding: const EdgeInsets.only(left: 32.0),
//              physics: BouncingScrollPhysics(),
//              scrollDirection: Axis.horizontal,
//              controller: controller,
//              children: store.filteredProducts.map((Product product) {
//                return Provider<Product>.value(
//                  value: product,
//                  child: ExploreProductCard(),
//                );
//              }).toList(),
//            ),
//          );
//        });
//  }
    return Text("text");
  }
}