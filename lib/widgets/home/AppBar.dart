import 'package:app/constanta.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Text(
      "مرحبا بيكم بالمتجر الالكرونيات",
      style: GoogleFonts.getFont("Almarai", color: kBackgroundColor),
    ),
    centerTitle: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: kBackgroundColor,
        ),
      )
    ],
  );
}
