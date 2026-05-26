import 'package:flutter/material.dart';

import '../classes/carga.dart';
import '../widgets/carga_card.dart';
import '../widgets/resumo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Carga> cargas = [];

  final mesController = TextEditingController();
  final kwhController = TextEditingController();
  final valorController = TextEditingController();

  void adicionarCarga() {
    if (mesController.text.isEmpty ||
        kwhController.text.isEmpty ||
        valorController.text.isEmpty) {
      return;
    }

    setState(() {
      cargas.add(
        Carga(
          mes: mesController.text,
          kwh: double.parse(kwhController.text),
          valor: double.parse(valorController.text),
        ),
      );
    });

    mesController.clear();
    kwhController.clear();
    valorController.clear();
  }

  double get totalValor {
    double total = 0;

    for (var carga in cargas) {
      total += carga.valor;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('CargaConsciente'),
        backgroundColor: Colors.green,
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'CargaConsciente',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),

            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
            ),

            const ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Relatórios'),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: mesController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Mês',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: kwhController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'kWh Consumido',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: valorController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: adicionarCarga,
              child: const Text('Salvar'),
            ),

            const SizedBox(height: 20),

            ResumoCard(
              titulo: 'Total gasto',
              valor: 'R\$ ${totalValor.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: cargas.length,
                itemBuilder: (context, index) {
                  return CargaCard(
                    carga: cargas[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}