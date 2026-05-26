import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const CargaConscienteApp());
}

class CargaConscienteApp extends StatelessWidget {
  const CargaConscienteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CargaConsciente',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}