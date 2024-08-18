import 'package:app/constanta.dart';
import 'package:app/models/fake.dart';
import 'package:app/widgets/Ditails/DitailsBody.dart';
import 'package:flutter/material.dart';

class DitailsScreen extends StatelessWidget {
  final Product product;

  const DitailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: DitailsBody(
        product: product,
      ),
      appBar: DetailsAppBar(context),
    );
  }

  AppBar DetailsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        padding: EdgeInsets.only(
          right: kDefaultPadding,
        ),
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
}
