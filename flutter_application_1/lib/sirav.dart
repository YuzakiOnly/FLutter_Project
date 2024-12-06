import 'package:flutter/material.dart';

class Siravs extends StatelessWidget {
  const Siravs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colored CircleAvatars'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blue, // Warna biru
              radius: 50.0, // Ukuran lingkaran
            ),
            SizedBox(height: 20), // Jarak antar avatar
            CircleAvatar(
              backgroundColor: Colors.yellow, // Warna kuning
              radius: 50.0, // Ukuran lingkaran
            ),
            SizedBox(height: 20), // Jarak antar avatar
            CircleAvatar(
              backgroundColor: Colors.red, // Warna merah
              radius: 50.0, // Ukuran lingkaran
            ),
          ],
        ),
      ),
    );
  }
}