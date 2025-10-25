import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ppkd_andra/constants/app_image.dart';
import 'package:ppkd_andra/constants/extension/rupiah.dart';
import 'package:ppkd_andra/models/model.dart';

class Listmodel extends StatefulWidget {
  const Listmodel({super.key});

  @override
  State<Listmodel> createState() => _Listmodel();
}

class _Listmodel extends State<Listmodel> {
  final List<Model> cosmetics = [
    Model(
      name: "Skincare",
      price: 50000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.skincare,
    ),
    Model(
      name: "Make up",
      price: 250000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.makeup,
    ),
    Model(
      name: "Hair Care",
      price: 100000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.haircare,
    ),
    Model(
      name: "Body Care",
      price: 125000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.bodycare,
    ),
    Model(
      name: "Nail Polish",
      price: 300000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.nailpolish,
    ),
    Model(
      name: "Fragrance",
      price: 350000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.fragrance,
    ),
    Model(
      name: "Male Product",
      price: 180000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.maleproduct,
    ),
    Model(
      name: "Cosmetic Tools",
      price: 150000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.makeuptools,
    ),
    Model(
      name: "Intimate Cosmetics",
      price: 180000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.intimatecosmetics,
    ),
    Model(
      name: "Ethnical Cosmetics",
      price: 150000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.ethnicalcosmetics,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cosmetics.length,
      itemBuilder: (BuildContext context, int index) {
        final item = cosmetics[index];
        return ListTile(
          onTap: () {},
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
      },
    );
  }
}
