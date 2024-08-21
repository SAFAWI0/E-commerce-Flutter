import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Order extends StatelessWidget {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController note = TextEditingController();

  void sent(BuildContext context) async {
    var headers = {
      'Authorization': 'Basic MTExODQ5ODE6NjAtZGF5ZnJlZXRyaWFs',
      'Content-Type': 'application/json',
    };

    var dio = Dio();
    var data = {
      "fullName": fullName.text,
      "phone": phone.text,
      "city": city.text,
      "street": street.text,
      "note": note.text,
    };

    try {
      var response = await dio.post(
        'http://safaasafaa-001-site1.htempurl.com/api/v1/Order/addorder',
        options: Options(
          headers: headers,
        ),
        data: json.encode(data),
      );

      if (response.statusCode == 200) {
        // Show success alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("نجاح"),
              content: Text("تم الحجز بنجاح"),
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
      } else {
        // Show error alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("خطأ"),
              content: Text("فشل الشراء: ${response.statusMessage}"),
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
    } catch (e) {
      // Handle exceptions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("خطأ"),
            content: Text("حدث خطأ: $e"),
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
        title: Text("تأكيد الشراء"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Full Name",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: fullName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Phone",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "City",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: city,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Street Address",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: street,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "Note",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextFormField(
              controller: note,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    sent(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(12),
                  ),
                  child: Text(
                    "Send",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
