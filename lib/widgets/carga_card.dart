import 'package:flutter/material.dart';

import '../classes/carga.dart';

class CargaCard extends StatelessWidget {

  final Carga carga;

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CargaCard({

    super.key,

    required this.carga,

    required this.onEdit,

    required this.onDelete,
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

        trailing: Row(

          mainAxisSize:
              MainAxisSize.min,

          children: [

            Text(

              'R\$ ${carga.valor.toStringAsFixed(2)}',

              style: const TextStyle(
                color: Colors.green,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            IconButton(

              onPressed: onEdit,

              icon: const Icon(
                Icons.edit,
                color: Colors.orange,
              ),
            ),

            IconButton(

              onPressed: onDelete,

              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
