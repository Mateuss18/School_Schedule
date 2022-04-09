import 'package:flutter/material.dart';

class HorariosPage extends StatefulWidget {
  const HorariosPage({Key? key}) : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horarios'),
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
