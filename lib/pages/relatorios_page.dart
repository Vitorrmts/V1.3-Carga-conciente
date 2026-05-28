import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';

class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text(
          'Relatórios',
        ),

        backgroundColor: Colors.green,
      ),

      backgroundColor:
          const Color(0xFF121212),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              'Resumo de Gastos',

              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(

              width: double.infinity,

              padding:
                  const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color:
                    const Color(0xFF1E1E1E),

                borderRadius:
                    BorderRadius.circular(
                        20),
              ),

              child: const Column(

                children: [

                  Icon(
                    Icons.bolt,
                    color: Colors.green,
                    size: 50,
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Relatórios em desenvolvimento',

                    textAlign:
                        TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Em breve você poderá visualizar gráficos e estatísticas de consumo.',

                    textAlign:
                        TextAlign.center,

                    style: TextStyle(
                      color:
                          Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
