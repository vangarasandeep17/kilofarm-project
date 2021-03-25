import 'package:flutter/material.dart';
import 'package:miniassignment/constants.dart';
import 'package:miniassignment/components/rounded_button.dart';
import 'package:miniassignment/screens/product_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String phoneNumber;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.shopping_cart_rounded,
              size: 100.0,
              color: Colors.black45,
            ),
            SizedBox(
              height: 100.0,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              onChanged: (value) {
                phoneNumber = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'enter your phone number',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'enter your password'),
            ),
            SizedBox(
              height: 100.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
