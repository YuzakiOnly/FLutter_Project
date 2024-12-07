import 'package:flutter/material.dart';
import 'package:basic_widget/apbars.dart';
import 'package:basic_widget/buttons.dart';
import 'package:basic_widget/colums.dart';
import 'package:basic_widget/containers.dart';
import 'package:basic_widget/footers.dart';
import 'package:basic_widget/scaffolds.dart';
import 'package:basic_widget/sirav.dart';
import 'package:basic_widget/text.dart';
import 'package:basic_widget/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BASIC WIDGET',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: const AppBarApp(), // Gantilah ke IconsExample sesuai nama class
    );
  }
}
