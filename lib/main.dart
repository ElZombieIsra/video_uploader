import 'package:flutter/material.dart';
import 'package:video_uploader/routes.dart';

void main() {
  runApp(VideoUploaderApp());
}

class VideoUploaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Uploader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
