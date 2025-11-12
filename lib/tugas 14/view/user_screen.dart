import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:ppkd_andra/tugas%2014/models/crypto_models.dart';
import 'package:ppkd_andra/tugas%2014/service/api.dart';

// ================= USER SCREEN =================
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<Crypto>> futureCrypto;
  List<Crypto> _allCrypto = [];
  List<Crypto> _filteredCrypto = [];
  List<String> _watchlist = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureCrypto = fetchCrypto();
    _loadWatchlist();
  }

  Future<void> _loadWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _watchlist = prefs.getStringList('watchlist') ?? [];
    });
  }

  Future<void> _toggleWatchlist(String id) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_watchlist.contains(id)) {
        _watchlist.remove(id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Dihapus dari watchlist'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else {
        _watchlist.add(id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('⭐ Ditambahkan ke watchlist'),
            backgroundColor: Colors.green,
          ),
        );
      }
      prefs.setStringList('watchlist', _watchlist);
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      futureCrypto = fetchCrypto();
    });
  }

  void _filterCrypto(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredCrypto = _allCrypto.where((crypto) {
        final name = crypto.name?.toLowerCase() ?? "";
        final symbol = crypto.symbol?.toLowerCase() ?? "";
        return name.contains(lowerQuery) || symbol.contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 2,
        title: TextField(
          controller: _searchController,
          onChanged: _filterCrypto,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '🔍 Cari crypto...',
            hintStyle: const TextStyle(color: Colors.white54),
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white54),
                    onPressed: () {
                      _searchController.clear();
                      _filterCrypto('');
                    },
                  )
                : null,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WatchlistPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Crypto>>(
        future: futureCrypto,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF00FF7F)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "❌ ${snapshot.error}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "Data tidak ditemukan",
                style: TextStyle(color: Colors.white70),
              ),
            );
          } else {
            _allCrypto = snapshot.data!;
            final cryptos = _searchController.text.isEmpty
                ? _allCrypto
                : _filteredCrypto;

            if (cryptos.isEmpty) {
              return const Center(
                child: Text(
                  "Tidak ada hasil pencarian",
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return RefreshIndicator(
              color: const Color(0xFF00FF7F),
              backgroundColor: const Color(0xFF1E293B),
              onRefresh: _refreshData,
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cryptos.length,
                itemBuilder: (context, index) {
                  final crypto = cryptos[index];
                  final isUp = (crypto.priceChangePercentage24H ?? 0) >= 0;
                  final colorChange = isUp
                      ? const Color(0xFF00FF7F)
                      : const Color(0xFFFF3B30);

                  return Card(
                    color: const Color(0xFF1E293B),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CryptoDetailPage(crypto: crypto),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 20,
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Rp ${(crypto.currentPrice ?? 0).toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${isUp ? '▲' : '▼'} ${(crypto.priceChangePercentage24H ?? 0).toStringAsFixed(2)}%",
                                style: TextStyle(
                                  color: colorChange,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              _watchlist.contains(crypto.id)
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                            ),
                            onPressed: () => _toggleWatchlist(crypto.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

// ================= DETAIL PAGE =================
class CryptoDetailPage extends StatelessWidget {
  final Crypto crypto;
  const CryptoDetailPage({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final isUp = (crypto.priceChangePercentage24H ?? 0) >= 0;
    final colorChange = isUp
        ? const Color(0xFF00FF7F)
        : const Color(0xFFFF3B30);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(
          crypto.name ?? '-',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage:
                  (crypto.image != null && crypto.image!.isNotEmpty)
                  ? NetworkImage(crypto.image!)
                  : const AssetImage('assets/placeholder.png') as ImageProvider,
            ),
            const SizedBox(height: 20),
            Text(
              crypto.symbol?.toUpperCase() ?? '-',
              style: const TextStyle(fontSize: 16, color: Colors.white54),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp ${(crypto.currentPrice ?? 0).toStringAsFixed(0)}",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${isUp ? '▲' : '▼'} ${(crypto.priceChangePercentage24H ?? 0).toStringAsFixed(2)}%",
              style: TextStyle(
                color: colorChange,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "📊 Detail Coin\n\n"
                "Nama: ${crypto.name ?? '-'}\n"
                "Symbol: ${crypto.symbol?.toUpperCase() ?? '-'}\n"
                "Market Cap Rank: ${crypto.marketCapRank ?? '-'}\n"
                "Harga Saat Ini: Rp ${(crypto.currentPrice ?? 0).toStringAsFixed(0)}\n"
                "Perubahan 24 Jam: ${(crypto.priceChangePercentage24H ?? 0).toStringAsFixed(2)}%",
                style: const TextStyle(color: Colors.white70, height: 1.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= WATCHLIST PAGE =================
class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  List<String> _watchlist = [];

  @override
  void initState() {
    super.initState();
    _loadWatchlist();
  }

  Future<void> _loadWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _watchlist = prefs.getStringList('watchlist') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('⭐ Watchlist'),
        backgroundColor: const Color(0xFF1E293B),
      ),
      body: _watchlist.isEmpty
          ? const Center(
              child: Text(
                "Belum ada coin di watchlist",
                style: TextStyle(color: Colors.white70),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _watchlist.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF1E293B),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(
                      _watchlist[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
