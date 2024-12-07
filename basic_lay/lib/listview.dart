import 'package:flutter/material.dart';

class ListViews extends StatelessWidget {
  ListViews({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Living Room',
      'Bed Room',
      'Dining Room',
      'Kitchen'
    ];

    final List<IconData> icons = [
      Icons.home,
      Icons.weekend,
      Icons.bed,
      Icons.dining,
      Icons.kitchen,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel ListView'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding keseluruhan
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ListView Horizontal
            SizedBox(
              height: 70, // Tinggi ListView horizontal
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.deepPurple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16), // Spasi antar ListView

            // ListView Vertikal
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), // Padding antar item
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            icons[index],
                            color: Colors.blueAccent,
                            size: 24,
                          ),
                          const SizedBox(width: 16), // Spasi antara ikon dan teks
                          Text(
                            categories[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}