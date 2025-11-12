import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:ppkd_andra/tugas%2014/models/crypto_models.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  List<Crypto> watchlist = [];

  @override
  void initState() {
    super.initState();
    _loadWatchlist();
  }

  Future<void> _loadWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList('watchlist') ?? [];
    setState(() {
      watchlist = savedList
          .map((item) => Crypto.fromJson(jsonDecode(item)))
          .toList();
    });
  }

  Future<void> _removeFromWatchlist(Crypto crypto) async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList('watchlist') ?? [];

    savedList.removeWhere((item) {
      final savedCrypto = Crypto.fromJson(jsonDecode(item));
      return savedCrypto.id == crypto.id;
    });

    await prefs.setStringList('watchlist', savedList);
    _loadWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text(
          "⭐ Watchlist",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        centerTitle: true,
      ),
      body: watchlist.isEmpty
          ? const Center(
              child: Text(
                "Belum ada crypto di watchlist",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: watchlist.length,
              itemBuilder: (context, index) {
                final crypto = watchlist[index];
                final isUp = (crypto.priceChangePercentage24H ?? 0) >= 0;
                final colorChange = isUp
                    ? const Color(0xFF00FF7F)
                    : const Color(0xFFFF3B30);

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundImage:
                          (crypto.image != null && crypto.image!.isNotEmpty)
                          ? NetworkImage(crypto.image!)
                          : const AssetImage('assets/placeholder.png')
                                as ImageProvider,
                    ),
                    title: Text(
                      crypto.name ?? '-',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      crypto.symbol?.toUpperCase() ?? '-',
                      style: const TextStyle(color: Colors.white54),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => _removeFromWatchlist(crypto),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
