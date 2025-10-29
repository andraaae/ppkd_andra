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
  bool obscurePass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBF3BB),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    //Image.asset(''),
                    SizedBox(height: 20),
                    Text('Register now', style: TextStyle(fontSize: 20)),

                    //menambahkan username, email, nomor telephone, dan password
                    SizedBox(height: 29),

                    Row(children: [Text('Username')]),
                    SizedBox(height: 7),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'what do we call you?',
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please make your username';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),

                    //email
                    SizedBox(height: 15),
                    Row(children: [Text('Email')]),
                    SizedBox(height: 7),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'please input email',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.mail),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email must contain @';
                        } else if (!value.contains('@')) {
                          return 'Email is invalid';
                        } else if (!RegExp(
                          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                        ).hasMatch(value)) {
                          return 'Email form is invalid';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                //nomor telephone
                SizedBox(height: 15),
                Row(children: [Text('Phone number')]),
                SizedBox(height: 7),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'please input phone number',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number can not be empty';
                    }
                    return null;
                  },
                ),

                //password
                SizedBox(height: 15),
                Row(children: [Text('Password')]),
                SizedBox(height: 7),
                TextFormField(
                  obscureText: !isVisible,

                  controller: passwordController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'please input password',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                          obscurePass = !obscurePass;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password can not be empty';
                    } else if (value.length < 7) {
                      return 'Minimum password length 7 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffB3E2A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      print('register');
                      setState(() {});
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xffFDFAF6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        print('Register');
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xffADD899),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFADD899),
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
