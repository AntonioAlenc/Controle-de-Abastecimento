import 'package:flutter/material.dart';

class MeusVeiculosPage extends StatelessWidget {
  final List<Map<String, String>> veiculos = [
    {'nome': 'Carro A', 'modelo': 'Sedan', 'ano': '2020', 'placa': 'ABC-1234'},
    {'nome': 'Carro B', 'modelo': 'SUV', 'ano': '2018', 'placa': 'DEF-5678'},
    {'nome': 'Carro C', 'modelo': 'Hatch', 'ano': '2022', 'placa': 'GHI-9012'},
  ];

  MeusVeiculosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Veículos'),
      ),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          final veiculo = veiculos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.directions_car, size: 40),
              title: Text('${veiculo['nome']} (${veiculo['modelo']})'),
              subtitle: Text('Ano: ${veiculo['ano']}\nPlaca: ${veiculo['placa']}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  // Ação para navegar para os detalhes do veículo
                  print('Detalhes do veículo: ${veiculo['nome']}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
