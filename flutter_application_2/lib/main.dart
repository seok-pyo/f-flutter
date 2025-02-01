import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/homeScreen.dart';
import 'package:flutter_application_2/service/api.service.dart';

void main() {
  ApiService().getTodayToons();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
