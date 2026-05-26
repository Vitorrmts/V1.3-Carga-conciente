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
      color: Colors.grey[900],
      child: ListTile(
        title: Text(
          carga.mes,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '${carga.kwh} kWh',
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Text(
          'R\$ ${carga.valor.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}