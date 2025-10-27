import 'package:flutter/material.dart';
class CosmeticModel {
  final String name;
  final String image;
  final Color? backgroundColor;
  CosmeticModel({
    required this.name,
    required this.image,
    this.backgroundColor,
  });
}