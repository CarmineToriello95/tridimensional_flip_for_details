import 'package:flutter/material.dart';
import 'package:tridimensional_flip_for_details/screens.dart/utils.dart';

class ItemDescription extends StatefulWidget {
  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription>
    with TickerProviderStateMixin {
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _colorAnimation = ColorTween(begin: kPrimaryColor, end: kSecondaryColor)
        .animate(AnimationsHandler.screensController);
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
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam, nisi ut aliquid ex ea commodi consequatur. Duis aute irure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' +
                          'Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullamco laboriosam, nisi ut aliquid ex ea commodi consequatur.',
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Image.asset(
                      'assets/images/thumbnail.jpg',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
