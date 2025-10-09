import 'package:flutter/material.dart';

class ColumnWidgetDay7 extends StatelessWidget {
  const ColumnWidgetDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 251, 187),
      appBar: AppBar(title: Text("Profil Saya"), backgroundColor: const Color.fromARGB(255, 0, 138, 34)),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start, // start
        mainAxisAlignment: MainAxisAlignment.center, // center
        //mainAxisAlignment: MainAxisAlignment.spaceAround, // spaceAround
        //mainAxisAlignment: MainAxisAlignment.spaceBetween, // spaceBetween
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceEvenly
        //mainAxisAlignment: MainAxisAlignment.end, // end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama : Andra",
          style: TextStyle(fontSize: 20, ),
          ),
          Text("Saya juga disini di PPKD"),

          // Text("S"),
          // Text("A"),
        ],
      ),
    );
  }
}