import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {

  runApp(
    const CargaConscienteApp(),
  );
}

class CargaConscienteApp
    extends StatelessWidget {

  const CargaConscienteApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner:
          false,

      title: 'CargaConsciente',

      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor:
            const Color(0xFF121212),

        appBarTheme:
            const AppBarTheme(
          backgroundColor:
              Colors.green,
        ),
      ),

      home: const HomePage(),
    );
  }
}
