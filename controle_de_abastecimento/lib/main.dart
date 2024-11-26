import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'telas/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle de Abastecimento',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
