import 'package:flutter/material.dart';
import 'package:petshop/constants.dart';
import 'package:petshop/crud/listprt.dart';


class Body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListQuestion(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
