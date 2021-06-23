import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petshop/components/my_bottom_nav_bar.dart';
import 'package:petshop/screens/home/components/body.dart';
import 'package:petshop/screens/home/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}