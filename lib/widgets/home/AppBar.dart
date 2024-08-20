import 'package:app/constanta.dart';
import 'package:app/screens/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    title: Text(
      "مرحبا بيكم بالمتجر الالكرونيات",
      style: GoogleFonts.getFont("Almarai", color: kBackgroundColor),
    ),
    centerTitle: false,
    automaticallyImplyLeading: false, //ازاله زر الرجوع
    actions: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        icon: Icon(
          Icons.login,
          color: kBackgroundColor,
        ),
      ),
    ],
  );
}
