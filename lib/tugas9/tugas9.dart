import 'package:flutter/material.dart';

//1
class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
  final List<String> cosmetics = [
    "Skincare",
    "Makeup",
    "Haircare",
    "Body Care",
    "Nail Polish",
    "Fragrance",
    "Male Cosmetics",
    "Cosmetic Tools",
    "Intimate Cosmetics",
    "Ethnical Cosmetics",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cosmetics.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(cosmetics[index]));
        },
      ),
    );
  }
}
