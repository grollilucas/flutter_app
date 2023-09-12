import 'package:appads/view/aluno_page.dart';
import 'package:appads/view/feriado_page.dart';
import 'package:appads/view/login_page.dart';
import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(child: Text('Menu')),
          ),
          ListTile(
            title: const Text('Alunos'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AlunoPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Feriados'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeriadoPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
