import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  final List<Map<String, dynamic>> abastecimentos = [
    {
      'data': '2024-11-20',
      'litros': 45.3,
      'km': 12000,
    },
    {
      'data': '2024-11-15',
      'litros': 40.0,
      'km': 11800,
    },
    {
      'data': '2024-11-10',
      'litros': 50.5,
      'km': 11500,
    },
  ];

  HistoricoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Abastecimentos'),
      ),
      body: ListView.builder(
        itemCount: abastecimentos.length,
        itemBuilder: (context, index) {
          final abastecimento = abastecimentos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.local_gas_station, size: 40),
              title: Text('Data: ${abastecimento['data']}'),
              subtitle: Text(
                'Litros: ${abastecimento['litros']} L\nQuilometragem: ${abastecimento['km']} km',
              ),
            ),
          );
        },
      ),
    );
  }
}
