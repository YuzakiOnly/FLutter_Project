import 'package:flutter/material.dart';

class Scaffolds extends StatefulWidget {
  const Scaffolds({super.key});

  @override
  State<Scaffolds> createState() => _ScaffoldsState();
}

class _ScaffoldsState extends State<Scaffolds> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
        child: Text('You have pressed the button $_count times.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}