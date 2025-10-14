import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEDED1),
      appBar: AppBar(
        title: Text(
          "User Form",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFBADFDB),
          ),
        ),
        backgroundColor: Color(0xFF043915),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 13),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Please enter your name",
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 13),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Please enter your email",
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 13),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Please enter your phone number",
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),

            SizedBox(height: 20),
            Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 13),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Please enter your description",
                hintStyle: TextStyle(fontSize: 12),
              ),
            ),
            const Text("data"),
          ],
        ),
      ),
    );
  }
}
