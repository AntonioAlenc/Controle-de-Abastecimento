import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bem-vindo!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Simulação de login
                print('Login realizado');
              },
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                // Navegar para a tela de cadastro
                print('Ir para Cadastro');
              },
              child: const Text('Não tem uma conta? Cadastre-se'),
            ),
            TextButton(
              onPressed: () {
                // Função de recuperação de senha
                print('Recuperar senha');
              },
              child: const Text('Esqueceu sua senha?'),
            ),
          ],
        ),
      ),
    );
  }
}
