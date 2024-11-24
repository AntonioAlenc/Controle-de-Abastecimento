import 'package:flutter/material.dart';
import '../data/abastecimentos_data.dart';

class RegistrarAbastecimentoPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController dataController = TextEditingController();
  final TextEditingController litrosController = TextEditingController();
  final TextEditingController quilometragemController = TextEditingController();

  RegistrarAbastecimentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Abastecimento'),
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
                  labelText: 'Data (AAAA-MM-DD)',
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
                  labelText: 'Quantidade de Litros',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade de litros';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: quilometragemController,
                decoration: const InputDecoration(
                  labelText: 'Quilometragem Atual',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quilometragem atual';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Insira um valor numérico válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AbastecimentosData.abastecimentos.add(
                      Abastecimento(
                        data: dataController.text,
                        litros: double.parse(litrosController.text),
                        quilometragem: double.parse(quilometragemController.text),
                      ),
                    );
                    Navigator.pop(context); // Voltar para a tela anterior
                  }
                },
                child: const Text('Salvar Abastecimento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
