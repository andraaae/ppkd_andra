import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(240, 255, 255, 255),
      appBar: AppBar(title: Text("Profil Saya"), backgroundColor: const Color.fromARGB(255, 248, 246, 132)),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center, // center
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Andra", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color:const Color.fromARGB(255, 0, 0, 0)),),
          
          Row(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 155, 42, 42),),
                Text("Jakarta Timur",
              style: TextStyle(fontSize: 22),),
              ]),
            
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Saya seorang pelajar yang sedang belajar Flutter", style: TextStyle(fontSize: 12),)
          ],
        )
        ])   );
}}