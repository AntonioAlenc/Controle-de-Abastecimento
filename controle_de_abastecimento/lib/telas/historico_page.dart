import 'package:controle_de_abastecimento/telas/adicionar_abastecimento_page.dart';
import 'package:flutter/material.dart';
import '../data/abastecimentos_data.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    final abastecimentos = AbastecimentosData.abastecimentos;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarAbastecimentoPage()),
          ).then((_) {
            setState(() {}); // Atualiza a lista após adicionar
          });
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Abastecimento',
      ),
    );
  }
}
