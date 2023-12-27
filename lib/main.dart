import 'package:flutter/material.dart';
import 'package:suit_media1/first_screen.dart';

void main() => runApp(const MainActivity());

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      );
  }
}