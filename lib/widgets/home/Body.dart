import 'package:app/models/Api.dart';
import 'package:app/screens/DitailsScreen.dart';
import 'package:app/widgets/home/Card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  Future<List<Product>> fetchProducts() async {
    var headers = {
      'Authorization': 'Basic MTExODQ5ODE6NjAtZGF5ZnJlZXRyaWFs',
    };
    var dio = Dio();
    var response = await dio.get(
      'http://safaasafaa-001-site1.htempurl.com/api/v1/product/getallproduct',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      var data = response.data as List<dynamic>;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      print(response.statusMessage);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Product>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CCard(
                index: index,
                product: snapshot.data![index],
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DitailsScreen(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
