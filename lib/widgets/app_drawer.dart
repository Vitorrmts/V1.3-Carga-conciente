import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/relatorios_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: ListView(

        children: [

          DrawerHeader(

            decoration: const BoxDecoration(
              color: Colors.green,
            ),

            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Image.asset(
                  'assets/logo.png',
                  height: 80,
                ),

                const SizedBox(height: 10),

                const Text(
                  'CARGACONSCIENTE',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Sua recarga, seu controle.',

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          ListTile(

            leading: const Icon(Icons.home),

            title: const Text('Início'),

            onTap: () {

              Navigator.pushReplacement(
                context,

                MaterialPageRoute(
                  builder: (_) =>
                      const HomePage(),
                ),
              );
            },
          ),

          ListTile(

            leading:
                const Icon(Icons.bar_chart),

            title:
                const Text('Relatórios'),

            onTap: () {

              Navigator.pushReplacement(
                context,

                MaterialPageRoute(
                  builder: (_) =>
                      const RelatoriosPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
