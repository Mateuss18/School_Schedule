import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_images.dart';
import '../../../tela_em_desenvolvimento.dart';
import '../../horarios/pages/horarios_page.dart';

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
        body: Column(
          children: [
            _buildCard(Colors.blue),
            _buildCard(Colors.red),
            _buildCard(Colors.green),
            _buildCard(Colors.yellow),
          ],
        ));
  }

  Widget _buildCard(Color color) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const TelaEmDesenvolvimento()),
        );
      }),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Container(
          height: 95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.centerRight,
                colors: [
                  color,
                  color.withOpacity(0.5),
                ],
              )),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.notasBrancoSVG),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Disciplina',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text('Média: 10'),
                      Text('Total de notas: 3'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
