import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //center
      appBar: AppBar(title: Text("My Profile")),
      body: Column(
        children: [
          Center(child: Text("Andra Riedwan", style: TextStyle(fontSize: 30))),

          //padding
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Container(
              color: const Color.fromARGB(255, 255, 176, 209),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_business),
                      SizedBox(width: 25, height: 30),
                      Text(
                        "andrariedwan@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),

                  //padding + row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone),
                        Spacer(),
                        Text("0888888888"),
                        SizedBox(width: 25, height: 30),
                      ],
                    ),
                  ),

                  //container
                ],
              ),
            ),
          ),
          Row(
            spacing: 15,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(250, 255, 145, 150),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(children: [Text("0"), Text("Post")]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(249, 203, 255, 193),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(children: [Text("288 M"), Text("Followers")]),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 40, width: 35),
          ),
          Column(
            children: [
              Text(
                "I'm a beginnner that know nothing, duh.",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 194, 189),
                  const Color.fromARGB(255, 183, 223, 255),
                  const Color.fromARGB(255, 215, 255, 217),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 24),
                    Text("AAARRRGGGHHH", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
