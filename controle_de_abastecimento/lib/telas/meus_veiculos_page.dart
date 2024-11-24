import 'package:flutter/material.dart';
import '../data/veiculos_data.dart';
import 'detalhes_veiculo_page.dart';

class MeusVeiculosPage extends StatelessWidget {
  MeusVeiculosPage({Key? key}) : super(key: key);

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
              title: Text('${veiculo.nome} (${veiculo.modelo})'),
              subtitle: Text('Ano: ${veiculo.ano}\nPlaca: ${veiculo.placa}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesVeiculoPage(veiculo: veiculo),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
