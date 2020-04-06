import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppleMusicBottomSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              color: Colors.black12,
              child: Center(
                child: Text("Apple Music Bottom Sheet"),
              ),
            ),
          ),
          BottomSheet()
        ],
      ),
    );
  }
}

const double minHeight = 64;

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height - 128;
  double get bottomSheetCornerRadius => lerp(8, 32);
  double get imageTopMargin => lerp(8, 32);
  double get imageLeftMargin => lerp(20, 32);
  double get imageSize => lerp(48, MediaQuery.of(context).size.width - 64);
  double get imageCornerRadius => lerp(4, 8);
  double get headerTopMargin => lerp(22, 36 + imageTopMargin + imageSize);
  double get headerLeftMargin => lerp(imageLeftMargin + imageSize + 16, 32);
  double get headerFontSize => lerp(16, 24);
  double get playIconSize => lerp(36, 64);
  double get playIconRightMargin => lerp(18, (MediaQuery.of(context).size.width / 2) - 32);
  double get playIconBottomMargin => lerp(14, 110);

  double lerp(double min, double max) => lerpDouble(min, max, _controller.value);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 64,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(bottomSheetCornerRadius)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0,-10),
                    )
                  ]
              ),
              child: Stack(
                children: <Widget>[
                  MusicImage(
                    topMargin: imageTopMargin,
                    leftMargin: imageLeftMargin,
                    size: imageSize,
                    cornerRadius: imageCornerRadius,
                  ),
                  BottomSheetHeader(
                    topMargin: headerTopMargin,
                    leftMargin: headerLeftMargin,
                    fontSize: headerFontSize,
                  ),
                  VolumeSlider(
                    isVisible: _controller.status == AnimationStatus.completed,
                  ),
                  PlayIcon(
                    size: playIconSize,
                    rightMargin: playIconRightMargin,
                    bottomMargin: playIconBottomMargin,
                  ),
                ],
              ),
            ),
          )
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }
}

class MusicImage extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double size;
  final double cornerRadius;
  
  const MusicImage({
    Key key,
    @required this.topMargin,
    @required this.leftMargin,
    @required this.size,
    @required this.cornerRadius,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: topMargin,
      left: leftMargin,
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Image.network(
            "https://i.pinimg.com/564x/e6/9e/dc/e69edcea94354077981e0c3770628ae9.jpg",
          fit: BoxFit.cover,
//          alignment: Alignment(lerp(1, 0), 0),
        ),
      ),
    );
  }
}

class BottomSheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final double leftMargin;

  const BottomSheetHeader({
    Key key,
    @required this.fontSize,
    @required this.topMargin,
    @required this.leftMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: topMargin,
      left: leftMargin,
      child: Text(
        'Booked music',
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class PlayIcon extends StatelessWidget {
  final double size;
  final double rightMargin;
  final double bottomMargin;

  PlayIcon({
    Key key,
    @required this.size,
    @required this.rightMargin,
    @required this.bottomMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      right: rightMargin,
      bottom: bottomMargin,
      height: size,
      width: size,
      child: Icon(
        Icons.play_arrow,
        color: Colors.black38,
        size: size,
      ),
    );
  }
}

class VolumeSlider extends StatelessWidget {
  final bool isVisible;

  const VolumeSlider({
    Key key,
    this.isVisible
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 32,
      left: 32,
      right: 32,
      height: 64,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.volume_mute
              ),
            ),
            Center(
              child: MySlider(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.volume_up
              ),
            )
          ],
        )
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 280,
      child: CupertinoSlider(
        value: _sliderValue,
        min: 0,
        max: 100,
        activeColor: Colors.black26,
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        },
      ),
    );
  }
}