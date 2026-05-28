import 'package:flutter/material.dart';

import '../classes/carga.dart';
import '../database/database_helper.dart';
import '../widgets/app_drawer.dart';
import '../widgets/carga_card.dart';
import '../widgets/resumo_card.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  List<Carga> cargas = [];

  final mesController =
      TextEditingController();

  final kwhController =
      TextEditingController();

  final valorController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarCargas();
  }

  Future carregarCargas() async {

    final data =
        await DatabaseHelper
            .instance
            .getCargas();

    setState(() {
      cargas = data;
    });
  }

  Future adicionarCarga() async {

    if (mesController.text.isEmpty ||
        kwhController.text.isEmpty ||
        valorController.text.isEmpty) {
      return;
    }

    final carga = Carga(

      mes: mesController.text,

      kwh: double.parse(
        kwhController.text,
      ),

      valor: double.parse(
        valorController.text,
      ),
    );

    await DatabaseHelper.instance
        .insertCarga(carga);

    carregarCargas();

    mesController.clear();
    kwhController.clear();
    valorController.clear();

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content: Text(
          'Carga salva!',
        ),
      ),
    );
  }

  Future editarCarga(
      Carga carga) async {

    mesController.text = carga.mes;

    kwhController.text =
        carga.kwh.toString();

    valorController.text =
        carga.valor.toString();

    showDialog(

      context: context,

      builder: (_) {

        return AlertDialog(

          backgroundColor:
              const Color(0xFF1E1E1E),

          title: const Text(

            'Editar carga',

            style: TextStyle(
              color: Colors.white,
            ),
          ),

          content: Column(

            mainAxisSize:
                MainAxisSize.min,

            children: [

              TextField(

                controller:
                    mesController,

                style:
                    const TextStyle(
                  color:
                      Colors.white,
                ),

                decoration:
                    const InputDecoration(
                  labelText: 'Mês',
                ),
              ),

              const SizedBox(
                  height: 10),

              TextField(

                controller:
                    kwhController,

                keyboardType:
                    TextInputType.number,

                style:
                    const TextStyle(
                  color:
                      Colors.white,
                ),

                decoration:
                    const InputDecoration(
                  labelText:
                      'kWh',
                ),
              ),

              const SizedBox(
                  height: 10),

              TextField(

                controller:
                    valorController,

                keyboardType:
                    TextInputType.number,

                style:
                    const TextStyle(
                  color:
                      Colors.white,
                ),

                decoration:
                    const InputDecoration(
                  labelText:
                      'Valor',
                ),
              ),
            ],
          ),

          actions: [

            ElevatedButton(

              onPressed:
                  () async {

                final novaCarga =
                    Carga(

                  id: carga.id,

                  mes:
                      mesController
                          .text,

                  kwh: double.parse(
                    kwhController
                        .text,
                  ),

                  valor: double.parse(
                    valorController
                        .text,
                  ),
                );

                await DatabaseHelper
                    .instance
                    .updateCarga(
                        novaCarga);

                carregarCargas();

                Navigator.pop(
                    context);
              },

              child: const Text(
                  'Salvar'),
            ),
          ],
        );
      },
    );
  }

  Future excluirCarga(
      int id) async {

    await DatabaseHelper.instance
        .deleteCarga(id);

    carregarCargas();
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
      ),

      body: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          children: [

            Image.asset(
              'assets/logo.png',
              height: 100,
            ),

            const SizedBox(
                height: 10),

            const Text(

              'Sua recarga, seu controle.',

              style: TextStyle(
                color:
                    Colors.white70,
              ),
            ),

            const SizedBox(
                height: 20),

            ResumoCard(

              titulo:
                  'Total gasto',

              valor:
                  'R\$ ${totalValor.toStringAsFixed(2)}',
            ),

            const SizedBox(
                height: 20),

            TextField(

              controller:
                  mesController,

              style:
                  const TextStyle(
                color:
                    Colors.white,
              ),

              decoration:
                  const InputDecoration(
                labelText: 'Mês',
              ),
            ),

            const SizedBox(
                height: 10),

            TextField(

              controller:
                  kwhController,

              keyboardType:
                  TextInputType.number,

              style:
                  const TextStyle(
                color:
                    Colors.white,
              ),

              decoration:
                  const InputDecoration(
                labelText:
                    'kWh Consumido',
              ),
            ),

            const SizedBox(
                height: 10),

            TextField(

              controller:
                  valorController,

              keyboardType:
                  TextInputType.number,

              style:
                  const TextStyle(
                color:
                    Colors.white,
              ),

              decoration:
                  const InputDecoration(
                labelText:
                    'Valor (R\$)',
              ),
            ),

            const SizedBox(
                height: 20),

            SizedBox(

              width:
                  double.infinity,

              child: ElevatedButton(

                onPressed:
                    adicionarCarga,

                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      Colors.green,
                ),

                child: const Text(
                  'Salvar',
                ),
              ),
            ),

            const SizedBox(
                height: 20),

            Expanded(

              child:
                  ListView.builder(

                itemCount:
                    cargas.length,

                itemBuilder:
                    (context, index) {

                  final carga =
                      cargas[index];

                  return CargaCard(

                    carga: carga,

                    onEdit: () {
                      editarCarga(
                          carga);
                    },

                    onDelete: () {
                      excluirCarga(
                          carga.id!);
                    },
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
