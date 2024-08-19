import 'package:app/constanta.dart';
import 'package:app/models/fake.dart';
import 'package:app/widgets/Ditails/DetailsAppBar.dart';
import 'package:app/widgets/Ditails/DitailsBody.dart';
import 'package:flutter/material.dart';

class DitailsScreen extends StatelessWidget {
  final Product product;

  const DitailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: DetailsAppBar(context),
      body: DitailsBody(
        product: product,
      ),
    );
  }
}
