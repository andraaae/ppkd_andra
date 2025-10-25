import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerModel {
  int? id;
  String name;
  String email;
  String password;
  String city;
  CustomerModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.city
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'city': city,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}