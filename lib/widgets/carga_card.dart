import 'package:flutter/material.dart';

import '../classes/carga.dart';

class CargaCard extends StatelessWidget {

  final Carga carga;

  const CargaCard({
    super.key,
    required this.carga,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      color: const Color(0xFF1E1E1E),

      child: ListTile(

        leading: const Icon(
          Icons.bolt,
          color: Colors.green,
        ),

        title: Text(
          carga.mes,

          style: const TextStyle(
            color: Colors.white,
          ),
        ),

        subtitle: Text(

          '${carga.kwh} kWh',

          style: const TextStyle(
            color: Colors.white70,
          ),
        ),

        trailing: Text(

          'R\$ ${carga.valor.toStringAsFixed(2)}',

          style: const TextStyle(
            color: Colors.green,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
