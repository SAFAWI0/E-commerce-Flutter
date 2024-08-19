import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void login() async {
    var headers = {'Authorization': 'Basic MTExODQ5ODE6NjAtZGF5ZnJlZXRyaWFs'};

    var dio = Dio();
    var data = {
      "email": email,
      "password": password,
    };
    var response = await dio.request(
      'http://safaasafaa-001-site1.htempurl.com/api/v1/user/addusers',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: json.encode(data),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true, //****password
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                  ),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    login();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
