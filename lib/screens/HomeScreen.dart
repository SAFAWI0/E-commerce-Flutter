import 'package:app/widgets/home/AppBar.dart';
import 'package:app/widgets/home/Body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Body(),
      backgroundColor: Color(0xFF219ebc),
    );
  }
}
