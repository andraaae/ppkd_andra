import 'package:flutter/material.dart';

class TugasSlicing extends StatefulWidget {
  const TugasSlicing({super.key});

  @override
  State<TugasSlicing> createState() => _TugasSlicingState();
}

class _TugasSlicingState extends State<TugasSlicing> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topLeft),
                Image.asset("assets/images/LinkedIn_Logo.jpg", height: 37),
                SizedBox(height: 100),

                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                Text(
                  "Stay updated on your proffesional world",
                  style: TextStyle(fontSize: 18),
                ),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email or Phone",
                    hintStyle: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
