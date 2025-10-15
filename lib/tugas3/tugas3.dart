import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 13),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Please enter your name",
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 13),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Please enter your email",
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Phone Number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 13),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Please enter your phone number",
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 13),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(30),
                      hintText: "Please enter your description",
                      hintStyle: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "Grid",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 1),
                  GridView.builder(
                    padding: EdgeInsets.all(40),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFB0CE88),
                        ),

                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Text(
                              "pic ${index + 1}",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
