import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool isButtonEnabled = true; // Status tombol

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: isButtonEnabled
                  ? () {
                      // Aksi ketika tombol enabled ditekan
                      print('Enabled button pressed');
                    }
                  : null, // Tombol dinonaktifkan
              child: Text(isButtonEnabled ? 'Enabled' : 'Disabled'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                // Aksi untuk mengubah status tombol
                setState(() {
                  isButtonEnabled = !isButtonEnabled; // Toggle status tombol
                });
              },
              child: Text(isButtonEnabled
                  ? 'Disable Button'
                  : 'Enable Button'), // Teks berubah sesuai status
            ),
          ],
        ),
      ),
    );
  }
}