import 'package:controle_de_abastecimento/telas/adicionar_veiculo_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MeusVeiculosPage extends StatelessWidget {
  const MeusVeiculosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Veículos'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('veiculos').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhum veículo cadastrado.'));
          }
          final veiculos = snapshot.data!.docs;
          return ListView.builder(
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarVeiculoPage()),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Veículo',
      ),
    );
  }
}
