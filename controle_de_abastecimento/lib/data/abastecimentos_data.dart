class Abastecimento {
  final String data;
  final double litros;
  final double quilometragem;

  Abastecimento({
    required this.data,
    required this.litros,
    required this.quilometragem,
  });
}

class AbastecimentosData {
  static final List<Map<String, dynamic>> abastecimentos = [];
}
