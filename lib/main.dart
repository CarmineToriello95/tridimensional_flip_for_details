import 'package:flutter/material.dart';
import 'package:tridimensional_flip_for_details/screens.dart/custom_app_bar.dart';
import 'dart:math' as math;
import 'package:tridimensional_flip_for_details/screens.dart/item.dart';
import 'package:tridimensional_flip_for_details/screens.dart/item_description.dart';
import 'package:tridimensional_flip_for_details/screens.dart/item_name.dart';

import 'screens.dart/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        Utils.screenHeight = MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top;
        return MyHomePage();
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> alpha;
  bool _isDraggable;

  @override
  void initState() {
    super.initState();
    AnimationsHandler.screensController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    final Animation curve = CurvedAnimation(
        parent: AnimationsHandler.screensController, curve: Curves.easeIn);
    alpha = Tween<double>(begin: 0, end: 1).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: AnimationsHandler.screensController,
        builder: (context, _) {
          return Stack(
            children: <Widget>[
              Container(
                color: kPrimaryColor,
              ),
              Transform.translate(
                offset: Offset(
                    0,
                    MediaQuery.of(context).size.height -
                        kMaxSlide * alpha.value),
                child: ItemDescription(),
              ),
              Transform.translate(
                offset: Offset(0, -kMaxSlide * alpha.value),
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(-math.pi * alpha.value / 2),
                  child: Item(),
                ),
              ),
              Transform.translate(
                offset: Offset(
                  0,
                  -(kMaxSlide - Utils.screenHeight * 0.20) * alpha.value,
                ),
                child: ItemName(),
              ),
              CustomAppBar()
            ],
          );
        },
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromBottom =
        AnimationsHandler.screensController.isDismissed &&
            details.globalPosition.dy > 500;
    bool isDragCloseFromTop = AnimationsHandler.screensController.isCompleted &&
        details.globalPosition.dy < 200;
    _isDraggable = isDragOpenFromBottom || isDragCloseFromTop;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDraggable) {
      double delta = details.primaryDelta / kMaxSlide;
      AnimationsHandler.screensController.value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (AnimationsHandler.screensController.isDismissed ||
        AnimationsHandler.screensController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dy.abs() >= Utils.screenHeight) {
      double visualVelocity =
          -(details.velocity.pixelsPerSecond.dy / Utils.screenHeight);
      AnimationsHandler.screensController.fling(velocity: visualVelocity);
    } else if (AnimationsHandler.screensController.value > 0.5) {
      AnimationsHandler.screensController.forward();
    } else {
      AnimationsHandler.screensController.reverse();
    }
  }
}
