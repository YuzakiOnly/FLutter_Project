import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotNavs extends StatefulWidget {
  const BotNavs({super.key});

  @override
  State<BotNavs> createState() => _BotNavsState();
}

class _BotNavsState extends State<BotNavs> {
  int _selectedIndex = 0;

  final List<Map<String, String>> menuItems = [
    {'icon': 'assets/home.svg', 'label': 'Home'},
    {'icon': 'assets/search.svg', 'label': 'Search'},
    {'icon': 'assets/settings.svg', 'label': 'Settings'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Bottom Navigation",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '${menuItems[_selectedIndex]['label']}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: menuItems.map((i) {
            final isSelected = menuItems.indexOf(i) == _selectedIndex;
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blueAccent : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      i['icon']!,
                      color: isSelected ? Colors.white : Colors.grey,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(height: 4), // Spasi antara ikon dan label
                  Text(
                    i['label']!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }).toList(),
        ),
      ),
    );
  }
}
