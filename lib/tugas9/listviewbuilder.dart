import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_andra/models/model.dart';

class ListviewBuilder extends StatefulWidget {
  const ListviewBuilder({super.key});

  @override
  State<ListviewBuilder> createState() =>
      _ListviewBuilderState();
}

class _ListviewBuilderState
    extends State<ListviewBuilder> {
  final List<Map<String, dynamic>> cosmetics = [
    {
      "name": "Skincare",
      "image": Models.skincare
      },
    {
      "name": "Makeup",
      "image": Models.makeup,
    },
    {
      "name": "Hair Care",
      "image": Models.haircare,
    },
    {
      "name": "Body Care",
      "image": Models.bodycare,
    },
    {
      "name": "Nail Polish",
      "image": Models.nailpolish,
    },
    {
      "name" : "Fragrance",
      "image": Models.fragrance
    },
    {
      "name" : "Male cosmetics",
      "image" : Models.maleproduct
    },
    {
      "name" : "Cosmetic Tools",
      "image": Models.cosmetictools
    },
    {
      "name" : "Intimate Cosmetics",
      "image" :Models.intimatecosmetics
    },
    {
      "nama" : "Ethnical Cosmetics",
      "image" : Models.ethnicalcosmetics
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                title: Text(
                 "Cosmetic selected"
                  
                ),
              ),
            ).show(context);
          },
          leading: Image.asset(item["image"], width: 60),
          title: Text(item["name"]),
         
        );
      },
    );
  }
}