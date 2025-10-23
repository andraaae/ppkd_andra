import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_andra/constants/app_image.dart';
import 'package:ppkd_andra/models/model.dart';

class ListviewBuilder extends StatefulWidget {
  const ListviewBuilder({super.key});

  @override
  State<ListviewBuilder> createState() => _ListviewBuilderState();
}

class _ListviewBuilderState extends State<ListviewBuilder> {
  final List<Map<String, dynamic>> cosmetics = [
    {"name": "Skincare", "image": AppImage.skincare},
    {"name": "Makeup", "image": AppImage.makeup},
    {"name": "Hair Care", "image": AppImage.haircare},
    {"name": "Body Care", "image": AppImage.bodycare},
    {"name": "Nail Polish", "image": AppImage.nailpolish},
    {"name": "Fragrance", "image": AppImage.fragrance},
    {"name": "Male cosmetics", "image": AppImage.maleproduct},
    {"name": "Cosmetic Tools", "image": AppImage.makeuptools},
    {"name": "Intimate Cosmetics", "image": AppImage.intimatecosmetics},
    {"nama": "Ethnical Cosmetics", "image": AppImage.ethnicalcosmetics},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cosmetics.length,
        itemBuilder: (BuildContext context, int index) {
          final item = cosmetics[index];
          return ListTile(
            onTap: () {
              DelightToastBar(
                autoDismiss: true,
                snackbarDuration: Duration(milliseconds: 2000),
                builder: (context) => ToastCard(
                  leading: Icon(Icons.flutter_dash, size: 28),
                  title: Text("Cosmetic selected"),
                ),
              ).show(context);
            },
            leading: Image.asset(item["image"], width: 60),
            title: Text(item["name"]),
          );
        },
      ),
    );
  }
}
