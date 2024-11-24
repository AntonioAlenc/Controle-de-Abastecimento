import 'package:flutter/material.dart';
import 'login_page.dart';

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
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false, // Remove todas as telas anteriores
              );
              print('Usuário desconectado'); // Simulação de logout
            },
          ),
        ],
      ),
    );
  }
}
