import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showText1 = true;
  bool showIcon = true;
  bool showDescription = true;
  bool showText2 = true;
  bool showText3 = true;
  int counter = 0;
  double counter1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF3D1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              print(("tambah $counter"));
              counter++;
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              print("kurang $counter");
              counter--;
              setState(() {});
            },

            child: Icon(Icons.minimize),
          ),
        ],
      ),
      //name
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  if (showText1)
                    Text(
                      "Andra",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF525B44),
                      ),
                    ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5A6C57),
                    ),
                    onPressed: () {
                      print("show name : $showText1");
                      showText1 = !showText1;
                      setState(() {});
                    },
                    child: Text("show name"),
                  ),
                ],
              ),
            ),
          ),

          //icon
          Column(
            children: [
              IconButton(
                onPressed: () {
                  showIcon = !showIcon;
                  setState(() {});
                },
                icon: Icon(
                  showIcon ? Icons.favorite : Icons.favorite,
                  color: showIcon ? Color(0xFF4C763B) : Color(0xFFD3F1DF),
                ),
              ),
              if (showIcon) const Text("liked", style: TextStyle(fontSize: 10)),
              SizedBox(height: 15),
            ],
          ),
          Text("angka = $counter"),

          //description
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextButton(
                  onPressed: () {
                    print("description");
                    setState(() {
                      showDescription = !showDescription;
                    });
                  },
                  child: const Text("see more"),
                ),
              ),
              if (showDescription) const Text("description"),
            ],
          ),

          Container(
            height: 200,
            width: 200,
            alignment: Alignment.center,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
            child: InkWell(
              splashColor: Color(0xFF16476A),
              onTap: () {
                print("kotak disentuh");
                setState(() {
                  showText3 = !showText3;
                });
              },
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Text(
                    showText3 ? "" : "xdjkkwhdisd",
                    style: TextStyle(fontSize: 20),
                    selectionColor: Color(0xFFFFFD8F),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          GestureDetector(
            onLongPress: () {
              print("long press");
              setState(() {});
              counter1 += 3;
            },
            onDoubleTap: () {
              print("Double tap");
              setState(() {
                counter1 += 2;
              });
            },
            onTap: () {
              print("one tap");
              setState(() {
                counter1++;
              });
            },
            child: Text('Tekan Aku'),
          ),
          Center(child: Text("jumlah : $counter1")),
        ],
      ),
    );
  }
}
