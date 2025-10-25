import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas2/tugas2.dart';
import 'package:ppkd_andra/tugas3/tugas3.dart';
import 'package:ppkd_andra/tugas4/tugas4.dart';
import 'package:ppkd_andra/tugas6/tugas_slicing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TugasSlicing()),
                );
              },
              child: Text("Back to Login"),
            ),
          ),

          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas4()),
                );
              },
              child: Text("go to tugas 4"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas3()),
                );
              },
              child: Text("go to tugas 3"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Tugas2()),
                  (route) => false,
                );
              },
              child: Text("go to tugas 2"),
            ),
          ),
        ],
      ),
    );
  }
}
