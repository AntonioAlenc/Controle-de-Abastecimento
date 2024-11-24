import 'package:flutter/material.dart';
import 'registrar_abastecimento_page.dart';

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
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40.0, color: Colors.blue),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Registrar Abastecimento'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegistrarAbastecimentoPage(),
                ),
              );
            },
          ),
          // Outros itens permanecem inalterados...
        ],
      ),
    );
  }
}
