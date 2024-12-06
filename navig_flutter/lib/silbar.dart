import 'package:flutter/material.dart';

class Silbars extends StatelessWidget {
  const Silbars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,  // Set to true or false based on your need
            snap: false,   // Set to true or false based on your need
            floating: true,  // Set to true or false based on your need
            expandedHeight: 200.0,  // Numeric value for height
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Silver Bar App'),
              background: FlutterLogo(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.blue[200],
                  height: 100,
                  child: Center(
                    child: Text(
                      '$index',
                      textScaleFactor: 5,
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}