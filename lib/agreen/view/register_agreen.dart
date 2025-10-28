import 'package:flutter/material.dart';

class RegisterAgreen extends StatefulWidget {
  const RegisterAgreen({super.key});

  @override
  State<RegisterAgreen> createState() => _RegisterAgreenState();
}

class _RegisterAgreenState extends State<RegisterAgreen> {
  final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool isVisible = false;
    bool _obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA3DC9A),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                //Image.asset(''),
                SizedBox(height: 20),
                Text('Register now', style: TextStyle(fontSize: 20),
                ),

                //menambahkan username, email, nomor telephone, dan password
                SizedBox(height: 29),
                Text('Username'),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                ), 
                hintText: 'make your username',
                hintStyle: TextStyle(fontSize: 12),
                ),
                ),
                Icon(Icons.person),
                //email
                SizedBox(height: 15),
                Text('Email'),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'please input email',
                hintStyle: TextStyle(fontSize: 12),
                ),
                ),
                Icon(Icons.mail),
                //nomor telephone
                SizedBox(height: 15),
                Text('Phone number'),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'please input phone number',
                hintStyle: TextStyle(fontSize: 12),
                ),
                ),
                Icon(Icons.phone),
                //password
                SizedBox(height: 15),
                Text('Password'),
                TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'please input password',
                hintStyle: TextStyle(fontSize: 12),
                ),
                ),
                IconButton(
                  onPressed: (){},
                   icon: Icon(Icons.visibility),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}