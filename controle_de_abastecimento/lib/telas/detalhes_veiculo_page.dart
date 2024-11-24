import 'package:flutter/material.dart';
import '../models/veiculo.dart';

class DetalhesVeiculoPage extends StatelessWidget {
  final Veiculo veiculo;

  const DetalhesVeiculoPage({Key? key, required this.veiculo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cálculo simulado da média de consumo
    double quilometragemAnterior = 11500; // Mock data
    double quilometragemAtual = 12000;    // Mock data
    double litrosAbastecidos = 50.0;      // Mock data
    double mediaConsumo = (quilometragemAtual - quilometragemAnterior) / litrosAbastecidos;

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
              'Média de Consumo: ${mediaConsumo.toStringAsFixed(2)} km/L',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
