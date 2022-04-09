import 'package:flutter/material.dart';

class AusenciaPage extends StatefulWidget {
  const AusenciaPage({Key? key}) : super(key: key);

  @override
  State<AusenciaPage> createState() => _AusenciaPageState();
}

class _AusenciaPageState extends State<AusenciaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ausencias'),
      ),
      body: const Center(
        child: Text(
          'Tela Em Desenvolvimento',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
