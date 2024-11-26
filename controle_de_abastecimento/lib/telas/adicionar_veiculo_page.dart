import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdicionarVeiculoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  final TextEditingController placaController = TextEditingController();

  AdicionarVeiculoPage({Key? key}) : super(key: key);

  Future<void> _salvarVeiculoNoFirestore(BuildContext context) async {
    try {
      final docRef = await FirebaseFirestore.instance.collection('veiculos').add({
        'nome': nomeController.text,
        'modelo': modeloController.text,
        'ano': anoController.text,
        'placa': placaController.text,
      });
      print('Veículo salvo com ID: ${docRef.id}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veículo salvo com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      print('Erro ao salvar veículo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar veículo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: modeloController,
                decoration: const InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modelo do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: anoController,
                decoration: const InputDecoration(
                  labelText: 'Ano',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o ano';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: placaController,
                decoration: const InputDecoration(
                  labelText: 'Placa',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a placa do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _salvarVeiculoNoFirestore(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
