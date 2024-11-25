import 'package:controle_de_abastecimento/telas/adicionar_veiculo_page.dart';
import 'package:flutter/material.dart';
import '../data/veiculos_data.dart';

class MeusVeiculosPage extends StatefulWidget {
  const MeusVeiculosPage({Key? key}) : super(key: key);

  @override
  State<MeusVeiculosPage> createState() => _MeusVeiculosPageState();
}

class _MeusVeiculosPageState extends State<MeusVeiculosPage> {
  @override
  Widget build(BuildContext context) {
    final veiculos = VeiculosData.veiculos;

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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarVeiculoPage()),
          ).then((_) {
            setState(() {}); // Atualiza a lista após adicionar
          });
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Veículo',
      ),
    );
  }
}
