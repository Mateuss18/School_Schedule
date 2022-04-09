import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/core/app_images.dart';

class DisciplinasPage extends StatefulWidget {
  const DisciplinasPage({Key? key}) : super(key: key);

  @override
  State<DisciplinasPage> createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<DisciplinasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Disciplinas',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 214, 214, 214),
          child: Column(
            children: [_buildCard(), _buildCard(), _buildCard(), _buildCard()],
          ),
        ));
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 95,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerRight,
              colors: [
                AppColors.corPrimaria,
                Color.fromARGB(255, 147, 192, 228),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SvgPicture.asset(AppImages.disciplinasBrancoSVG),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome da Disciplina',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text('Nome do professor'),
                    Text('Numero de ausencias'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
