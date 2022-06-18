import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../shared/widgets/card_widget.dart';

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
          title: const Text('Disciplinas'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ExpansionTile(
                    children: [
                      sadas('Avaliação 2', '8'),
                      sadas('Trabalho gestao', '9')
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 40',
                      thirdlyLabel: '',
                      color: AppColors.corRed,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('Avaliação 2', '8'),
                      sadas('Trabalho gestao', '9')
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 40',
                      thirdlyLabel: '',
                      color: Colors.pink,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('Avaliação 2', '8'),
                      sadas('Trabalho gestao', '9')
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 40',
                      thirdlyLabel: '',
                      color: Colors.blue,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('Avaliação 2', '8'),
                      sadas('Trabalho gestao', '9')
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 40',
                      thirdlyLabel: '',
                      color: Colors.green,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('Avaliação 2', '8'),
                      sadas('Trabalho gestao', '9'),
                      sadas('Trabalho gestao', '9'),
                      sadas('Trabalho gestao', '9'),
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 40',
                      thirdlyLabel: '',
                      color: Colors.orange,
                      onpressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget sadas(String titulo, String nota) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: AppColors.corDarkGrey3,
                ),
                child: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Text('${titulo}: ${nota}')
        ],
      ),
    );
  }
}
