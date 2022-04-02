import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule/core/app_colors.dart';

import '../../../core/app_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppImages.darkModeSVG,
            ),
            const Text(
              'Menu',
              style: TextStyle(color: Colors.black),
            ),
            SvgPicture.asset(AppImages.configuracoesSVG)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  _buildCircularButtons(
                      SvgPicture.asset(AppImages.disciplinasBrancoSVG,
                          height: 90, width: 90, fit: BoxFit.scaleDown),
                      AppColors.corPrimaria,
                      true,
                      'Disciplinas',
                      Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCircularButtons(
                          SvgPicture.asset(
                            AppImages.notasBrancoSVG,
                            height: 90,
                            width: 90,
                            fit: BoxFit.scaleDown,
                          ),
                          AppColors.corPrimaria,
                          true,
                          'notas',
                          Colors.white),
                      _buildCircularButtons(
                          SvgPicture.asset(AppImages.horariosAzulSVG,
                              height: 90, width: 90, fit: BoxFit.scaleDown),
                          Colors.white,
                          true,
                          'Horarios',
                          Colors.black),
                      _buildCircularButtons(
                          SvgPicture.asset(AppImages.agendaBrancoSVG,
                              height: 90, width: 90, fit: BoxFit.scaleDown),
                          AppColors.corPrimaria,
                          true,
                          'Agenda',
                          Colors.white),
                    ],
                  ),
                  _buildCircularButtons(
                      SvgPicture.asset(AppImages.ausenciasBrancoAzulSVG,
                          height: 90, width: 90, fit: BoxFit.scaleDown),
                      AppColors.corPrimaria,
                      true,
                      'Ausencias',
                      Colors.white),
                ],
              ),
              const Divider(
                color: Colors.black,
                height: 10,
              ),
              Column(
                children: <Widget>[
                  cardHorario(),
                  cardHorario(),
                  cardHorario(),
                  cardHorario(),
                  cardHorario(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardHorario() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: AppColors.corPrimaria,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppImages.iconHorarioAzulBrancoSVG),
                  const SizedBox(width: 20),
                  const Text('Horarios'),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: AppColors.corPrimaria,
                ),
                width: 300,
                height: 60,
                child: const Center(
                  child: Text(
                    'Não há aulas hoje',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Divider(
                color: AppColors.corPrimaria,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Mostrar mais   ',
                    style: TextStyle(color: Colors.black),
                  ),
                  SvgPicture.asset(
                    AppImages.setaSVG,
                    color: Colors.black,
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
      Widget dsad, Color color, bool shadow, String label, Color? textColor) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: color,
              boxShadow: [
                if (shadow == true)
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
              ],
            ),
            height: 120,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                dsad,
                Text(
                  label,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
