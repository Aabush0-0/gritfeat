import 'package:flutter/material.dart';
import 'package:my_app/services/send_post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Optional here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CreatePostPage(),
    );
  }
}
