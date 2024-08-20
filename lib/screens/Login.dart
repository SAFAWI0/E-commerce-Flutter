import 'package:app/constanta.dart';
import 'package:app/screens/HomeScreen.dart';
import 'package:app/screens/Register.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  Login createState() => Login();
}

class Login extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  bool Loading = false;

  void login(BuildContext context) async {
    setState(() {
      Loading = true;
    });
    var headers = {'Authorization': 'Basic MTExODQ5ODE6NjAtZGF5ZnJlZXRyaWFs'};

    var dio = Dio();
    var data = {
      "email": email.text,
      "password": password.text,
    };
    var response = await dio.request(
      'http://safaasafaa-001-site1.htempurl.com/api/v1/user/addusers',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: json.encode(data),
    );
    setState(() {
      Loading = false;
    });
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      // Show success alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("نجاح"),
            content: Text("تم التسجيل بنجاح"),
            actions: [
              TextButton(
                child: Text("حسنًا"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      print(response.statusMessage);
      // Show error alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("خطأ"),
            content: Text("فشل التسجيل: ${response.statusMessage}"),
            actions: [
              TextButton(
                child: Text("حسنًا"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
        automaticallyImplyLeading: false, //ازاله زر الرجوع
      ),
      body: Stack(
        children: [
          Center(
            child: Form(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Welcome to E-commerce",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "To Continue Log-in",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                      // obscureText: true, //****password
                      obscureText: obscurePassword,
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
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
                          login(context);
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "?Don't have an account",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (Loading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
