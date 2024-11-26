import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'meus_veiculos_page.dart';
import 'historico_page.dart';
import 'perfil_page.dart';
import 'login_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String? nomeUsuario;
  String? emailUsuario;

  @override
  void initState() {
    super.initState();
    _carregarDadosUsuario();
  }

  Future<void> _carregarDadosUsuario() async {
    try {
      User? usuario = FirebaseAuth.instance.currentUser;
      if (usuario != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(usuario.uid)
            .get();

        if (snapshot.exists) {
          final dados = snapshot.data();
          setState(() {
            nomeUsuario = dados?['nome'] ?? 'Usuário Nome';
            emailUsuario = dados?['email'] ?? 'usuario@email.com';
          });
        }
      }
    } catch (e) {
      print('Erro ao carregar dados do usuário: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF121212),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                nomeUsuario ?? 'Carregando...',
                style: const TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                emailUsuario ?? 'Carregando...',
                style: const TextStyle(color: Colors.white70),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color(0xFFF3BA2F),
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 40.0, color: Colors.black),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF181A20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFFF3BA2F)),
              title: const Text(
                'Perfil',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_car, color: Color(0xFFF3BA2F)),
              title: const Text(
                'Meus Veículos',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MeusVeiculosPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFFF3BA2F)),
              title: const Text(
                'Histórico Geral de Abastecimentos',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoricoPage(
                      veiculoId: '',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFF3BA2F)),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
