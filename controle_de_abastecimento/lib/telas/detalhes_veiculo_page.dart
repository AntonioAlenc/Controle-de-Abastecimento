import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../data/abastecimentos_data.dart';

class DetalhesVeiculoPage extends StatelessWidget {
  final Veiculo veiculo;

  const DetalhesVeiculoPage({Key? key, required this.veiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final abastecimentos = AbastecimentosData.abastecimentos;

    // Verifica se há dados suficientes para calcular a média
    double mediaConsumo = 0;
    if (abastecimentos.length >= 2) {
      final abastecimentoMaisRecente = abastecimentos.last;
      final abastecimentoAnterior = abastecimentos[abastecimentos.length - 2];

      final quilometragemPercorrida = abastecimentoMaisRecente.quilometragem - abastecimentoAnterior.quilometragem;
      mediaConsumo = quilometragemPercorrida / abastecimentoMaisRecente.litros;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes: ${veiculo.nome}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informações do Veículo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Nome: ${veiculo.nome}', style: const TextStyle(fontSize: 18)),
            Text('Modelo: ${veiculo.modelo}', style: const TextStyle(fontSize: 18)),
            Text('Ano: ${veiculo.ano}', style: const TextStyle(fontSize: 18)),
            Text('Placa: ${veiculo.placa}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            const Text(
              'Consumo Médio',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              mediaConsumo > 0
                  ? 'Média de Consumo: ${mediaConsumo.toStringAsFixed(2)} km/L'
                  : 'Média de Consumo: Dados insuficientes',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
