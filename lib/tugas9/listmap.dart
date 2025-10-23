import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';

class Listmap extends StatefulWidget {
  const Listmap({super.key});

  @override
  State<Listmap> createState() => _ListmapState();
}

class _ListmapState extends State<Listmap> {
  final List<Map<String, dynamic>> cosmetics = [
    {"name": "Skincare", "Icon": Icons.account_balance_wallet_rounded},
    {"name": "Makeup", "Icon": Icons.access_alarms_sharp},
    {"name": "Hair Care", "Icon": Icons.add_comment},
    {"name": "Body Care", "Icon": Icons.accessibility_new_rounded},
    {"name": "Nail Polish", "Icon": Icons.add_circle_rounded},
    {"name": "Fragrance", "Icon": Icons.add_shopping_cart_sharp},
    {"name": "Male Cosmetics", "Icon": Icons.accessibility},
    {"name": "Cosmetic Tools", "Icon": Icons.add_to_photos},
    {"name": "Intimate Cosmetics", "Icon": Icons.join_full},
    {"name": "Ethnical Cosmetics", "Icon": Icons.api_sharp},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cosmetics.length,
        itemBuilder: (BuildContext context, int index) {
          final Item = cosmetics[index];
          return ListTile(
            onTap: () {
              DelightToastBar(
                autoDismiss: true,
                snackbarDuration: Duration(milliseconds: 1000),
                builder: (context) => ToastCard(
                  leading: Icon(Icons.flutter_dash, size: 20),
                  title: Text(
                    "${Item["name"]}.toString()",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ).show(context);
            },
            leading: Image.asset(Item["image"], width: 50),
            title: Text(Item["name"]),
          );
        },
      ),
    );
  }
}
