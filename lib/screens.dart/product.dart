import 'package:flutter/material.dart';
import 'package:tridimensional_flip_for_details/screens.dart/utils.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0.0,
      ),
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/stratocaster.png',
              height: Utils.screenHeight * 0.7,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: Utils.screenHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
