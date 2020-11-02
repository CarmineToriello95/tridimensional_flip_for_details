import 'package:flutter/material.dart';
import 'package:tridimensional_flip_for_details/screens.dart/product_description.dart';
import 'package:tridimensional_flip_for_details/screens.dart/product_name.dart';
import 'dart:math' as math;
import 'custom_app_bar.dart';
import 'product.dart';
import 'utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> alpha;
  bool _isDraggable;

  @override
  void initState() {
    super.initState();
    AnimationsHandler.animationController =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    final Animation curve = CurvedAnimation(
        parent: AnimationsHandler.animationController, curve: Curves.easeOut);
    alpha = Tween<double>(begin: 0, end: 1).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: AnimationsHandler.animationController,
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
                child: ProductDescription(),
              ),
              Transform.translate(
                offset: Offset(0, -kMaxSlide * alpha.value),
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(-math.pi * alpha.value / 2),
                  child: Product(),
                ),
              ),
              Transform.translate(
                offset: Offset(
                  0,
                  -(kMaxSlide - Utils.screenHeight * 0.20) * alpha.value,
                ),
                child: ProductName(),
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
        AnimationsHandler.animationController.isDismissed &&
            details.globalPosition.dy > kDragFromBottomEdge;
    bool isDragCloseFromTop =
        AnimationsHandler.animationController.isCompleted &&
            details.globalPosition.dy < kDragFromTopEdge;
    _isDraggable = isDragOpenFromBottom || isDragCloseFromTop;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isDraggable) {
      double delta = details.primaryDelta / kMaxSlide;
      AnimationsHandler.animationController.value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (AnimationsHandler.animationController.isDismissed ||
        AnimationsHandler.animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dy.abs() >= Utils.screenHeight) {
      double visualVelocity =
          -(details.velocity.pixelsPerSecond.dy / Utils.screenHeight);
      AnimationsHandler.animationController.fling(velocity: visualVelocity);
    } else if (AnimationsHandler.animationController.value > 0.5) {
      AnimationsHandler.showProductDescription();
    } else {
      AnimationsHandler.hideProductDescription();
    }
  }
}
