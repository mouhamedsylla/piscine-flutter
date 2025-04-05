import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BizzCard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BizzCardPage(),
    );
  }
}

class BizzCardPage extends StatelessWidget {
  const BizzCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('BizzCard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notifications'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Menu'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Container du texte (placé en premier dans la pile, donc en arrière-plan)
              Padding(
                padding: const EdgeInsets.only(
                  top: 70.0,
                ), // Décale vers le bas pour laisser de la place à la photo
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.blueAccent, width: 1),
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                    top: 80.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            QrImageView(
                              data: 'BEGIN:VCARD\nVERSION:3.0\nN:niao;miao\nFN:miao niao\nTEL:+33123456789\nEMAIL:miao.niao@cat.tom\nEND:VCARD',
                              version: QrVersions.auto,
                              size: 80,
                              backgroundColor: Colors.white,
                            ),
                            const Text(
                              'Scan for contact',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Nom
                      const Text(
                        'miao niao',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      _buildInfoRow(Icons.cake, 'Age: 30'),
                      const SizedBox(height: 50),

                      _buildInfoRow(Icons.email, 'Email: miao.niao@cat.tom'),
                      const SizedBox(height: 5),

                      _buildInfoRow(Icons.phone, 'Phone: +33 1 23 45 67 89'),
                    ],
                  ),
                ),
              ),

              // Container de la photo (placé en second, donc au premier plan)
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 3),
                  image: const DecorationImage(
                    image: AssetImage('assets/cat.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
      ],
      );
  }
}
