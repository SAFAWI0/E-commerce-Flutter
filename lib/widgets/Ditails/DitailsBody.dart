import 'package:app/constanta.dart';
import 'package:app/models/fake.dart';
import 'package:app/screens/Order.dart';
import 'package:app/widgets/Ditails/ProductImage.dart';
import 'package:flutter/material.dart';

class DitailsBody extends StatelessWidget {
  final Product product;

  const DitailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultFontSize * 2,
              ),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultFontSize,
                    ),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ProductImage(
                            size: size,
                            image: product.image,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: Text(
                            product.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Text(
                          "السعر :   ${product.price}\$",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: kSecondaryColor,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultFontSize * 1.5,
                  vertical: kDefaultFontSize / 2),
              child: Text(
                product.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Order()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  padding: EdgeInsets.all(8),
                ),
                child: Text(
                  "شراء",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
