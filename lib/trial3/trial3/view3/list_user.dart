import 'package:flutter/material.dart';
import 'package:ppkd_andra/trial3/trial3/model_trial/user_model.dart';
import 'package:ppkd_andra/tugas11/database/dbhelper.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  getData() {
    DbHelper.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("List data user:"),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.getAllStudent(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.username ?? ""),
                              subtitle: Text(items.email ?? ""),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
