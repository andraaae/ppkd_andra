import 'package:flutter/material.dart';
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/tugas%2015/models/profilemodel.dart';
import 'package:ppkd_andra/tugas%2015/service/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;
  String? username;
  String? email;
  Profile profile = Profile();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    // final savedUsername = await PreferenceHandler.getUsername();
    // final savedEmail = await PreferenceHandler.getEmail();
    final data = await AuthAPI.getProfile();
    setState(() {
      profile = data;
      // token = savedToken;
      username = data.data!.name;
      // email = savedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBF3BB),
      appBar: AppBar(backgroundColor: Colors.green[300], centerTitle: true),
      body: username == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () async {
                      final updated = await Navigator.pushNamed(
                        context,
                        "/edit_profile",
                      );

                      if (updated == true) {
                        loadUserData();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.green[200],
                            child: const Icon(Icons.person, size: 35),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile.data!.name ?? "-",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  profile.data!.email ?? "-",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final updated = await Navigator.pushNamed(
                                context,
                                "/edit_profile",
                              );

                              if (updated == true) {
                                loadUserData();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () async {
                        await PreferenceHandler.removeLogin();
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
