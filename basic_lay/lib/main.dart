import 'package:basic_lay/gridview.dart';
import 'package:basic_lay/asrat.dart';
import 'package:basic_lay/listview.dart';
import 'package:basic_lay/expanded.dart';
import 'package:basic_lay/wrap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BASIG LAYOUT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        useMaterial3: true,
      ),
      home: Wraps(), // Pastikan nama class sesuai
    );
  }
}