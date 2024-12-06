import 'package:flutter/material.dart';

void main() => runApp(const Footers());

class Footers extends StatelessWidget {
  const Footers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Only',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigationOnly(),
    );
  }
}

class BottomNavigationOnly extends StatefulWidget {
  const BottomNavigationOnly({super.key});

  @override
  _BottomNavigationOnlyState createState() => _BottomNavigationOnlyState();
}

class _BottomNavigationOnlyState extends State<BottomNavigationOnly> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 24)),
    Text('Search Page', style: TextStyle(fontSize: 24)),
    Text('Profile Page', style: TextStyle(fontSize: 24)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 255, 16, 151),
        onTap: _onItemTapped,
      ),
    );
  }
}