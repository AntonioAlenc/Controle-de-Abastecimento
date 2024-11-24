import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nomeUsuario = 'Usuário Nome';
  final String emailUsuario = 'usuario@email.com';

  PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Text(
                'U',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nome: $nomeUsuario',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'E-mail: $emailUsuario',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Simulação de edição
                print('Editar perfil');
              },
              child: const Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
