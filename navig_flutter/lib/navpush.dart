import 'package:flutter/material.dart';

class NavPushs extends StatelessWidget {
  const NavPushs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            "MASA LALU",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ini diperlukan untuk efek ShaderMask
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const NavigationPop(); // Gunakan kelas yang benar
                    },
                  ),
                );
              },
              child: const Text('UTIWI KE MASA DEPAN BOS BOS'),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationPop extends StatelessWidget {
  const NavigationPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.blue, Color.fromARGB(255, 255, 0, 0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: const Text(
            "MASA DEPAN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Ini diperlukan untuk efek ShaderMask
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("UTIWI KE MASA LALU"),
        ),
      ),
    );
  }
}