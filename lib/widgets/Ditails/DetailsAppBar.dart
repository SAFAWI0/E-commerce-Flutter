import 'package:flutter/material.dart';
import 'package:app/constanta.dart';

AppBar DetailsAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: kBackgroundColor,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    ),
    title: Text(
      "رجوع",
    ),
  );
}
