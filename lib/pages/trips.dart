import 'package:flutter/material.dart';

class Trips extends StatelessWidget {
  const Trips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 244, 168, 54),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      title: const Text(
        'Trips',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ));
  }
}
