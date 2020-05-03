import 'package:flutter/material.dart';
import 'utils.dart';

class ItemName extends StatefulWidget {
  @override
  _ItemNameState createState() => _ItemNameState();
}

class _ItemNameState extends State<ItemName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.transparent,
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Fender American Elite Strat',
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: Utils.screenHeight * 0.20 * 0.20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Opacity(
                      opacity: 1 - AnimationsHandler.screensController.value,
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
                            AnimationsHandler.showProductDescription(),
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
