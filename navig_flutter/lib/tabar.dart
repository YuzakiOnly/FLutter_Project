import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Binar - Tabbar"),
        backgroundColor: Colors.blue, // Warna latar belakang AppBar
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white, // Warna indikator tab yang aktif
          labelColor: Colors.white, // Warna ikon/tab yang aktif
          unselectedLabelColor: Colors.white70, // Warna ikon/tab yang tidak aktif
          tabs: const [
            Tab(icon: Icon(Icons.directions_boat)),
            Tab(icon: Icon(Icons.directions_bus)),
            Tab(icon: Icon(Icons.directions_ferry)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
        ],
      ),
    );
  }
}