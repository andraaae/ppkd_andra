import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFFCA),
      appBar: AppBar(
        title: Text(
          "Form  & Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF5A827E),
          ),
        ),
        backgroundColor: Color(0xFFB9D4AA),
      ),
      body: ListView(
        padding: EdgeInsets.all(25.0),
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            "Name",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              prefixIconColor: Color(0xFF3B3B1A),
              border: OutlineInputBorder(),
              hoverColor: Color(0xFF648DB3),
              contentPadding: EdgeInsets.all(10),
              hintText: "Please enter your name",
              hintStyle: TextStyle(fontSize: 12),
            ),
          ),

          SizedBox(height: 20),
          Text(
            "Email",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              prefixIconColor: Color(0xFF3B3B1A),
              border: OutlineInputBorder(),
              hoverColor: Color(0xFF648DB3),
              contentPadding: const EdgeInsets.all(10),
              hintText: "Please enter your name",
              hintStyle: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Number",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              prefixIconColor: Color(0xFF3B3B1A),
              border: OutlineInputBorder(),
              hoverColor: Color(0xFF648DB3),
              contentPadding: EdgeInsets.all(10),
              hintText: "Please enter your number",
              hintStyle: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Description",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.description),
              prefixIconColor: Color(0xFF3B3B1A),
              border: OutlineInputBorder(),
              hoverColor: Color(0xFF648DB3),
              contentPadding: EdgeInsets.all(25),
              hintText: "Please enter your description",
              hintStyle: TextStyle(fontSize: 12),
            ),
          ),

          SizedBox(height: 50),
          ListTile(
            title: Text("Product"),
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3B3B1A),
            ),
          ),

          ListTile(
            tileColor: Color(0xFFA8BBA3),
            leading: Image.asset("assets/images/tictac.jpg"),
            title: Text(
              "Tic Tac",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("1.000.000"),
            trailing: Icon(Icons.favorite, color: Color(0xFFF08787)),
          ),
          SizedBox(height: 18),
          ListTile(
            tileColor: Color(0xFFA8BBA3),
            leading: Image.asset("assets/images/japota.jpg"),
            title: Text(
              "Japota",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("5.000.000"),
            trailing: Icon(Icons.favorite, color: Color(0xFFF08787)),
          ),
          SizedBox(height: 18),
          ListTile(
            tileColor: Color(0xFFA8BBA3),
            leading: Image.asset("assets/images/wallens.jpg"),
            title: Text(
              "Wallens",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("2.000.000"),
            trailing: Icon(Icons.favorite, color: Color(0xFFF08787)),
          ),
          SizedBox(height: 18),
          ListTile(
            tileColor: Color(0xFFA8BBA3),
            leading: Image.asset("assets/images/cornetto.jpg"),
            title: Text(
              "Cornetto",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("7.000.000"),
            trailing: Icon(Icons.favorite, color: Color(0xFFF08787)),
          ),
          SizedBox(height: 18),
          ListTile(
            tileColor: Color(0xFFA8BBA3),
            leading: Image.asset("assets/images/silverqueenfruitnut.jpg"),
            title: Text(
              "Silverqueen",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("6.000.000"),
            trailing: Icon(Icons.favorite, color: Color(0xFFF08787)),
          ),
        ],
      ),
    );
  }
}
