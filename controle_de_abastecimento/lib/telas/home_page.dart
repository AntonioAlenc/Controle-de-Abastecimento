import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Abastecimento'),
      ),
      drawer: const DrawerMenu(), // Adiciona o Drawer
      body: const Center(
        child: Text(
          'Bem-vindo à Tela Principal!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
