class Carga {

  int? id;

  final String mes;
  final double kwh;
  final double valor;

  Carga({
    this.id,
    required this.mes,
    required this.kwh,
    required this.valor,
  });

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'mes': mes,
      'kwh': kwh,
      'valor': valor,
    };
  }

  factory Carga.fromMap(
      Map<String, dynamic> map) {

    return Carga(
      id: map['id'],
      mes: map['mes'],
      kwh: map['kwh'],
      valor: map['valor'],
    );
  }
}
