import 'package:flutter/material.dart';

class Listviewlist extends StatefulWidget {
  const Listviewlist({super.key});

  @override
  State<Listviewlist> createState() => _ListviewlistState();
}

class _ListviewlistState extends State<Listviewlist> {
  final List<String> cosmetics = [
    'Skincare',
    'Makeup',
    'Hair care',
    'Body Care',
    'Nail Polish',
    'Fragrance',
    'Male cosmetics',
    'Cosmetics tools',
    'Intimate cosmetics',
    'Ethnical cosmetics',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cosmetics.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(cosmetics[index]));
      },
    );
  }
}
