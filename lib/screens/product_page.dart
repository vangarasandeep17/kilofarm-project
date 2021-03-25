import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:miniassignment/constants.dart';
import 'package:miniassignment/components/rounded_button.dart';
import 'package:miniassignment/screens/product_listing.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _productCategory;
  String productName;
  List productCategory;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://6j57eve9a1.execute-api.us-east-1.amazonaws.com/staging/vegetable?item=all&userId=1"),
    );
    var data = json.decode(response.body);
    setState(() {
      productCategory = data["skuCategory"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                productName = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'enter product name',
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: _productCategory,
                    iconSize: 30.0,
                    hint: Text('select category'),
                    onChanged: (value) {
                      setState(() {
                        _productCategory = value;
                        getData();
                      });
                    },
                    items: productCategory?.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item["skuCategory"]),
                            value: item["skuCategory"].toString(),
                          );
                        })?.toList() ??
                        [],
                  ),
                ),
              ),
            ),
            RoundedButton(
              title: 'Next',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListing(),
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
