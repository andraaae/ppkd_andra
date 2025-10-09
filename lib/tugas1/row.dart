import 'package:flutter/material.dart';

class RowWidgetDay7 extends StatelessWidget {
  const RowWidgetDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(title: Text("PPKD Batch 4"), backgroundColor: const Color.fromARGB(255, 0, 126, 67)),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.start, // start
        mainAxisAlignment: MainAxisAlignment.center, // center
        //mainAxisAlignment: MainAxisAlignment.spaceAround, // spaceAround
        //mainAxisAlignment: MainAxisAlignment.spaceBetween, // spaceBetween
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spaceEvenly
        //mainAxisAlignment: MainAxisAlignment.end, // end
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Saya : "), Text("Habibie")],
          ),
        ],
      ),
    );
  }
}