import 'package:flutter/material.dart';

class TelaEmDesenvolvimento extends StatefulWidget {
  const TelaEmDesenvolvimento({Key? key}) : super(key: key);

  @override
  State<TelaEmDesenvolvimento> createState() => _TelaEmDesenvolvimentoState();
}

class _TelaEmDesenvolvimentoState extends State<TelaEmDesenvolvimento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela em desenvolvimento'),
      ),
      body: const Center(
        child: Text(
          'Nossos desenvolvedores estão trabalhando duro nisso logo mais estara pronta',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
