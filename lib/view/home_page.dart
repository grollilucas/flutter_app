import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double tamanho = 100.0;

  @override
  Widget build(BuildContext context) {
    return const Text("Home");
  }
}
