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
          backgroundColor: AppColors.corPrimaria,
          title: const Text(
            'Disciplinas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildCard(Colors.blue),
              _buildCard(Colors.red),
              _buildCard(Colors.green),
              _buildCard(Colors.yellow)
            ],
          ),
        ));
  }

  Widget _buildCard(Color color) {
    return Padding(
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
                    Text(
                      'Nome do professor',
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      'Numero de ausencias',
                      style: TextStyle(fontSize: 11)
                    )
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
