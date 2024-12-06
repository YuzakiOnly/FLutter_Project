import 'package:flutter/material.dart';

class AsRatios extends StatelessWidget {
  const AsRatios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspect Ratio Example'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 150 / 260, // Rasio lebar dan tinggi
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}