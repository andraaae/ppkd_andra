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
    {"name": "Skincare", "Image": Image.asset("assets/skincare.jpg")},
    {"name": "Makeup", "Image": Image.asset("assets/makeup.jpg")},
    {"name": "Hair Care", "Image": Image.asset("assets/haircare.jpg")},
    {"name": "Body Care", "Image": Image.asset("assets/body care.jpg")},
    {"name": "Nail Polish", "Image": Image.asset("assets/Nail polish.jpg")},
    {"name": "Fragrance", "Image": Image.asset("assets/fragrance.jpg")},
    {"name": "Male Cosmetics", "Image": Image.asset("assets/male product.jpg")},
    {"name": "Cosmetic Tools", "Image": Image.asset("assets/makeup tools.jpg")},
    {"name": "Intimate Cosmetics", "Image": Image.asset("assets/intimate cosmetics.jpg")},
    {"name": "Ethnical Cosmetics","Image": Image.asset("assets/ethnical products.png")},
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
