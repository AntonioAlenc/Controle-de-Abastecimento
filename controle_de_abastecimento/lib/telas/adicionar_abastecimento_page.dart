import 'package:flutter/material.dart';
import '../data/abastecimentos_data.dart';

class AdicionarAbastecimentoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dataController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();
  final TextEditingController kmController = TextEditingController();

  AdicionarAbastecimentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Abastecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: dataController,
                decoration: const InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a data do abastecimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: litrosController,
                decoration: const InputDecoration(
                  labelText: 'Litros',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade de litros';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: kmController,
                decoration: const InputDecoration(
                  labelText: 'Quilometragem Atual',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quilometragem atual';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AbastecimentosData.abastecimentos.add({
                      'data': dataController.text,
                      'litros': double.parse(litrosController.text),
                      'km': int.parse(kmController.text),
                    });
                    Navigator.pop(context);
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
