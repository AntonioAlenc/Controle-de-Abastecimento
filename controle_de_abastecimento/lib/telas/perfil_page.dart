import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController nomeController = TextEditingController();
  User? usuario = FirebaseAuth.instance.currentUser;

  Future<void> _carregarDadosUsuario() async {
    if (usuario != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(usuario!.uid)
          .get();

      if (snapshot.exists) {
        final dados = snapshot.data();
        nomeController.text = dados?['nome'] ?? '';
      }
    }
  }

  Future<void> _atualizarPerfil() async {
    try {
      if (usuario != null) {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(usuario!.uid)
            .set({'nome': nomeController.text}, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dados atualizados com sucesso!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar perfil: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: const OutlineInputBorder(),
                hintText: usuario?.email ?? '',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _atualizarPerfil,
              child: const Text('Atualizar Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
