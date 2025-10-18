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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Image.asset("assets/images/LinkedIn_Logo.jpg", height: 34),
                SizedBox(height: 31),

                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(height: 29),
                Text(
                  "Stay updated on your professional world",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 26),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email or Phone",
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 15),
                    suffix: InkWell(
                      borderRadius: BorderRadius.circular(20),

                      onTap: () {},
                      child: ClipRRect(
                        child: Text(
                          'show',
                          style: TextStyle(
                            color: Color(0xFF1472E0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    print('Forgot Password?');
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C82F9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      print('Sign in');
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        width: 148,
                        color: Color(0xFFBEBEBE),
                      ),
                    ),

                    SizedBox(height: 25, width: 6),
                    Text(
                      "or",
                      style: TextStyle(fontSize: 15, color: Color(0xFF323232)),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: 148,
                        color: Color(0xFFBEBEBE),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Continue with Google');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Google.png',
                          height: 24,
                          width: 39,
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Sign with Apple');
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Apple Logo.png',
                          height: 24,
                          width: 39,
                        ),
                        Text(
                          "Sign in with Apple",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to LinkedIn?"),
                    TextButton(
                      onPressed: () {
                        print('new to LinkedIn?');
                      },
                      child: Text(
                        "Join now",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF535AFC),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
