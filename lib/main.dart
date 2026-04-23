import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'package:flowyvision/features/tv_live/home_screen.dart';

import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const FlowyVisionApp());
}

class FlowyVisionApp extends StatelessWidget {
  const FlowyVisionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flowy Vision',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const NetflixHomeScreen(),
    );
  }
}
