import 'package:flutter/material.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
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
