import 'package:app/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  Register createState() => Register();
}

class Register extends State<RegisterScreen> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  bool obscurePassword = true;
  bool Loading = true;

  void register(BuildContext context) async {
    String pattern = r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password.text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("خطأ"),
            content:
                Text("الرمز يجب أن يحتوي على أحرف كبيرة، أرقام، ورموز خاصة."),
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
      return;
    }
    setState(() {
      Loading = true;
    });
    var headers = {'Authorization': 'Basic MTExODQ5ODE6NjAtZGF5ZnJlZXRyaWFs'};

    var dio = Dio();
    var data = {
      "name": fullName.text,
      "userName": userName.text,
      "password": password.text,
      "email": email.text,
      "phoneNumber": phonenumber.text,
    };
    var response = await dio.request(
      'http://safaasafaa-001-site1.htempurl.com/api/registration',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: json.encode(data),
    );
    setState(() {
      Loading = true;
    });
    if (response.statusCode == 200) {
      print(json.encode(response.data));
      // Show  alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("نجاح"),
            content: Text("عملية انشاء الحساب نجحت"),
            actions: [
              TextButton(
                child: Text("حسنًا"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      print("error: ${response.statusMessage}");

      // Show error alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("خطأ"),
            content: Text("فشل عملية انشاء الحساب: ${response.statusMessage}"),
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
    setState(() {
      Loading = false;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("انشاء الحساب"),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Sign up to see all the discounts and new offers",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: fullName,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userName,
                        decoration: InputDecoration(
                          labelText: "User Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phonenumber,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.blueAccent,
                          ),
                        ),
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
                            register(context);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.all(16),
                          ),
                          child: Text(
                            "Sign up",
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
