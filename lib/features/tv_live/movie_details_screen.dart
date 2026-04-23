import 'package:flutter/material.dart';
import 'package:flowyvision/style_constants.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NetflixStyles.blackBg,
      body: Center(
        child: SizedBox(
          width: 1280,
          height: 720,
          child: Container(), // Lienzo en blanco
        ),
      ),
    );
  }
}
