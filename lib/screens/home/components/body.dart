import 'package:flutter/material.dart';
import 'package:petshop/constants.dart';

import 'featurred_pet.dart';
import 'header_with_seachbox.dart';
import 'produk.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Rekomendasi Pakan Hewan", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Info Tentang Hewan", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
