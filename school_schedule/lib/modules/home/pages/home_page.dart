import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../agenda/page/agenda_page.dart';
import '../../ausencias/pages/ausencia_page.dart';
import '../../disciplinas/pages/disciplina_page.dart';
import '../../horarios/pages/horarios_page.dart';
import '../../notas/pages/notas_page.dart';
import '../../user/page/user_page.dart';

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
              child: SvgPicture.asset(AppImages.configuracoesSVG),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 18),
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
                          'Horários',
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
                        'Ausências',
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
                            style:
                                const TextStyle(color: AppColors.corDarkGray1),
                          )
                        ],
                      ),
                    ),
                    cardHorario(
                        AppColors.corRed,
                        'Horários',
                        'Atividades',
                        null,
                        null,
                        SvgPicture.asset(AppImages.iconHorarioAzulBrancoSVG), [
                      itemList(Colors.blue,
                          'Lab Engenharia de Software\n 7:40 - 9:20'),
                      itemList(Colors.white, ''),
                      itemList(
                          Colors.orange, 'Estrutura de Dados\n 9:30 - 13:00'),
                    ], () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HorariosPage()),
                      );
                    }),
                    cardHorario(
                        AppColors.corRed,
                        'Atividades',
                        'Atividades',
                        null,
                        null,
                        SvgPicture.asset(AppImages.avaliacaobrancoazul), [
                      itemList(Colors.blue, 'Apresentação da Sprint Final\n Lab Engenharia de Software'),
                      itemList(Colors.white, ''),
                      itemList(Colors.pink, 'Entrega trabalho no Teams\n Inglês V'),
                      itemList(Colors.white, ''),
                      itemList(Colors.brown, 'Relatorio desenvolvimento TCC 1\n Met Pesquisa'),
                    ], () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotasPage()),
                      );
                    }),
                    cardHorario(
                        AppColors.corRed,
                        'Avaliações',
                        'Atividades',
                        null,
                        null,
                        SvgPicture.asset(AppImages.atividadesbrancoazul), [
                      itemList(Colors.orange, 'Prova 2\n Estrutura de Dados'),
                    ], () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotasPage()),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHorario(
    Color color,
    String title,
    String subtitle,
    String? thertlyTitle,
    String? fuourtlyTitle,
    SvgPicture svg,
    List<Widget> lista,
    Function() onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.20),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
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
                    svg,
                    const SizedBox(width: 8),
                    Text(title, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
              Column(
                children: lista,
              ),
              const Divider(
                thickness: 1.7,
                color: AppColors.corPrimaria,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    // ignore: avoid_print
                    onTap: onTap,
                    child: const Text(
                      'Mostrar mais   ',
                      style: TextStyle(
                          color: AppColors.corDarkGray1, fontSize: 12),
                    ),
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

  Widget itemList(Color color, String value) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: color,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(value),
      ],
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
          elevation: 5,
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
