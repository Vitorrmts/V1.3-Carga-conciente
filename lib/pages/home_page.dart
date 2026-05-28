import 'package:flutter/material.dart';

import '../classes/carga.dart';
import '../widgets/app_drawer.dart';
import '../widgets/carga_card.dart';
import '../widgets/resumo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Carga> cargas = [];

  final TextEditingController
      mesController =
          TextEditingController();

  final TextEditingController
      kwhController =
          TextEditingController();

  final TextEditingController
      valorController =
          TextEditingController();

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

          kwh: double.parse(
            kwhController.text,
          ),

          valor: double.parse(
            valorController.text,
          ),
        ),
      );
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          'Carga adicionada!',
        ),
      ),
    );

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

      backgroundColor:
          const Color(0xFF121212),

      drawer: const AppDrawer(),

      appBar: AppBar(

        title: const Text(
          'CARGACONSCIENTE',
        ),

        centerTitle: true,

        backgroundColor:
            Colors.green,
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          children: [

            const SizedBox(height: 10),

            Image.asset(
              'assets/logo.png',
              height: 100,
            ),

            const SizedBox(height: 10),

            const Text(

              'Sua recarga, seu controle.',

              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            ResumoCard(

              titulo: 'Total gasto',

              valor:
                  'R\$ ${totalValor.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 20),

            TextField(

              controller: mesController,

              style:
                  const TextStyle(
                color: Colors.white,
              ),

              decoration:
                  InputDecoration(

                filled: true,

                fillColor:
                    const Color(
                        0xFF1E1E1E),

                labelText: 'Mês',

                labelStyle:
                    const TextStyle(
                  color:
                      Colors.white70,
                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                          15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(

              controller:
                  kwhController,

              keyboardType:
                  TextInputType.number,

              style:
                  const TextStyle(
                color: Colors.white,
              ),

              decoration:
                  InputDecoration(

                filled: true,

                fillColor:
                    const Color(
                        0xFF1E1E1E),

                labelText:
                    'kWh Consumido',

                labelStyle:
                    const TextStyle(
                  color:
                      Colors.white70,
                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                          15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(

              controller:
                  valorController,

              keyboardType:
                  TextInputType.number,

              style:
                  const TextStyle(
                color: Colors.white,
              ),

              decoration:
                  InputDecoration(

                filled: true,

                fillColor:
                    const Color(
                        0xFF1E1E1E),

                labelText:
                    'Valor (R\$)',

                labelStyle:
                    const TextStyle(
                  color:
                      Colors.white70,
                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                          15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                style:
                    ElevatedButton
                        .styleFrom(

                  backgroundColor:
                      Colors.green,

                  padding:
                      const EdgeInsets
                          .all(18),
                ),

                onPressed:
                    adicionarCarga,

                child: const Text(
                  'Salvar',
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(

              child:
                  cargas.isEmpty

                      ? const Center(

                          child: Text(

                            'Nenhuma carga cadastrada.',

                            style: TextStyle(
                              color:
                                  Colors
                                      .white54,

                              fontSize: 16,
                            ),
                          ),
                        )

                      : ListView.builder(

                          itemCount:
                              cargas.length,

                          itemBuilder:
                              (context,
                                  index) {

                            return CargaCard(
                              carga:
                                  cargas[
                                      index],
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
