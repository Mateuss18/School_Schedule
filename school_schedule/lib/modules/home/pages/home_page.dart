import 'dart:math';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/modules/ausencias/pages/ausencia_page.dart';
import 'package:school_schedule/modules/user/page/user_page.dart';

import '../../../core/app_images.dart';
import '../../agenda/page/agenda_page.dart';
import '../../disciplinas/pages/disciplina_page.dart';
import '../../horarios/pages/horarios_page.dart';
import '../../notas/pages/notas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppImages.darkModeSVG,
            ),
            const Text(
              'Menu',
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              child: SvgPicture.asset(AppImages.iconUserSVG),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserPage()),
                );
              }),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  _buildCircularButtons(
                      100,
                      SvgPicture.asset(AppImages.disciplinasBrancoSVG,
                          height: 90, width: 90, fit: BoxFit.scaleDown),
                      AppColors.corPrimaria,
                      'Disciplinas',
                      Colors.white, (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisciplinasPage()),
                    );
                  })),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircularButtons(
                          100,
                          SvgPicture.asset(
                            AppImages.notasBrancoSVG,
                            height: 90,
                            width: 90,
                            fit: BoxFit.scaleDown,
                          ),
                          AppColors.corPrimaria,
                          'Notas',
                          Colors.white, (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotasPage()),
                        );
                      })),
                      _buildCircularButtons(
                        15,
                        SvgPicture.asset(AppImages.horariosAzulSVG,
                            height: 90,
                            width: 90,
                            fit: BoxFit.scaleDown,
                            color: AppColors.corPrimaria),
                        Colors.white,
                        'Horarios',
                        AppColors.corPrimaria,
                        (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HorariosPage()),
                          );
                        }),
                      ),
                      _buildCircularButtons(
                        100,
                        SvgPicture.asset(AppImages.agendaBrancoSVG,
                            height: 90, width: 90, fit: BoxFit.scaleDown),
                        AppColors.corPrimaria,
                        'Agenda',
                        Colors.white,
                        (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AgendaPage()),
                          );
                        }),
                      ),
                    ],
                  ),
                  _buildCircularButtons(
                      100,
                      SvgPicture.asset(AppImages.ausenciasBrancoAzulSVG,
                          height: 90, width: 90, fit: BoxFit.scaleDown),
                      AppColors.corPrimaria,
                      'Ausencias',
                      Colors.white, (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AusenciaPage()),
                    );
                  }))
                ],
              ),
            ),
            Container(
              color: AppColors.corLightGray1,
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Atividades de hoje:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(now).toString(),
                          style: const TextStyle(color: AppColors.corDarkGray1),
                        )
                      ],
                    ),
                  ),
                  cardHorario(),
                  cardHorario(),
                  cardHorario(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardHorario() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.7,
              color: AppColors.corPrimaria,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.iconHorarioAzulBrancoSVG),
                    const SizedBox(width: 8),
                    const Text(
                      'Horarios',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.corPrimaria,
                ),
                width: 320,
                height: 60,
                margin: const EdgeInsets.only(bottom: 10),
                child: const Center(
                  child: Text(
                    'Não há aulas hoje',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Divider(
                thickness: 1.7,
                color: AppColors.corPrimaria,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Mostrar mais   ',
                    style:
                        TextStyle(color: AppColors.corDarkGray1, fontSize: 12),
                  ),
                  SvgPicture.asset(
                    AppImages.setaSVG,
                    color: AppColors.corDarkGray1,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButtons(
    double radius,
    Widget icon,
    Color color,
    String label,
    Color? textColor,
    Function()? onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Column(
          children: [
            icon,
            Text(
              label,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(120, 120),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          primary: color,
          onPrimary: const Color.fromARGB(255, 2, 45, 80),
        ),
      ),
    );
  }
}
