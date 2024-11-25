import 'package:controle_de_abastecimento/telas/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Abastecimento'),
      ),
      drawer: const DrawerMenu(), // Inclua o Drawer aqui
      body: const Center(
        child: Text(
          'Bem-vindo à Tela Principal!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Usuário Nome'),
            accountEmail: const Text('usuario@email.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text('Meus Veículos'),
            onTap: () {
              // Navegar para a tela "Meus Veículos"
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico de Abastecimentos'),
            onTap: () {
              // Navegar para a tela "Histórico"
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Implementar o logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
