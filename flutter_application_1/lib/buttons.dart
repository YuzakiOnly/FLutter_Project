import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElevatedButton Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Buttons(),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('ElevatedButton Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: null, // Tombol dinonaktifkan
              child: const Text('Disabled'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                // Aksi ketika tombol ditekan
                print('Enabled button pressed');
              },
              child: const Text('Enabled'),
            ),
          ],
        ),
      ),
    );
  }
}