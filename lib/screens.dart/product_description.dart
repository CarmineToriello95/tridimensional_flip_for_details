import 'package:flutter/material.dart';
import 'package:tridimensional_flip_for_details/screens.dart/utils.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription>
    with TickerProviderStateMixin {
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _colorAnimation = ColorTween(begin: kPrimaryColor, end: kSecondaryColor)
        .animate(AnimationsHandler.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: _colorAnimation.value,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: Utils.screenHeight * 0.20,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 1),
                        end: Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          curve: Interval(0.5, 0.7),
                          parent: AnimationsHandler.animationController,
                        ),
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam, nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' +
                            'Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam, nisi ut aliquid ex ea commodi consequatur.',
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 1),
                        end: Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          curve: Interval(0.8, 1.0),
                          parent: AnimationsHandler.animationController,
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/thumbnail.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
