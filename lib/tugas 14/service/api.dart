import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppkd_andra/tugas%2014/models/crypto_models.dart';

Future<List<Crypto>> fetchCrypto() async {
  try {
    final response = await http.get(
      Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr",
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception("Gagal memuat data (${response.statusCode})");
    }
  } catch (e) {
    throw Exception("Terjadi kesalahan: $e");
  }
}
