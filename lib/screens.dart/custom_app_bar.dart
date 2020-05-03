import 'package:flutter/material.dart';

import 'utils.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'PRODUCT DETAIL',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: AnimationsHandler.animationController,
            color: Colors.black87,
          ),
          onPressed: () => AnimationsHandler.hideProductDescription(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: Utils.screenHeight * 0.7,
            ),
            SizedBox(
              height: Utils.screenHeight * 0.05,
            ),
            Container(
              height: Utils.screenHeight * 0.20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    Opacity(
                      opacity: 0,
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'SPEC',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                        onTap: () =>
                            AnimationsHandler.animationController.forward(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
