import 'package:flutter/material.dart';

class Program {
  final String title;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final double progress; 

  Program({
    required this.title, 
    this.description = 'Experience high-octane cinematic action in this premium selection.',
    this.imageUrl = 'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?q=80&w=2070&auto=format&fit=crop',
    this.videoUrl = 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    this.progress = 0.0,
  });
}

class Channel {
  final String id;
  final IconData icon;
  final List<Program> programs;

  Channel({required this.id, required this.icon, required this.programs});
}
