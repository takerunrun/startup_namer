import 'package:flutter/material.dart';

class ExploreProductCard extends StatelessWidget {
    Color textColor() {
      return Color(0xFFA26FFF);
  }

  @override
  Widget build(BuildContext context) {
//    final Product product = Provider.of(context);
    return ProductCard(
      width: 150,
      height: 250,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 65,
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Text(
              "name",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor(),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 115,
            width: 130,
            alignment: Alignment.topCenter,
            child: Hero(
              tag: "product.uid",
              child: Image.network(
                "https://image.biccamera.com/img/00000007871178_A01.jpg?sr.dw=320&sr.jqh=60&sr.dh=320&sr.mat=1",
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 12),
            height: 30,
            child: Text(
              "\$" + 300.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: textColor().withAlpha(200),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    Key key,
    @required this.child,
    @required this.width,
    @required this.height,
    @required this.color,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
//    final Product product = Provider.of(context);
    return GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => ProductScreen(
//              product: product,
//            ),
//          ),
//        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            child,
            Align(
              alignment: Alignment.bottomRight,
              child: _ArrowIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(40),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white.withAlpha(200),
      ),
    );
  }
}