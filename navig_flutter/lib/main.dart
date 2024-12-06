
import 'package:flutter/material.dart';
import 'package:navig_flutter/botnav.dart';
import 'package:navig_flutter/drawwer.dart';
import 'package:navig_flutter/navpush.dart';
import 'package:navig_flutter/silbar.dart';
import 'package:navig_flutter/tabar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 95, 248, 0),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(), // Gunakan nama kelas dengan benar
    );
  }
}
