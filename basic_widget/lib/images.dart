import 'package:flutter/material.dart';

class ImageMyWidget extends StatelessWidget {
  const ImageMyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset('assets/images/cihuy.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
