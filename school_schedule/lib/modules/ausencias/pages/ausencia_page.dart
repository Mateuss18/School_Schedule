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
          title: const Text('Ausências'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ExpansionTile(
                    children: [
                      sadas('09/05/2022', '2'),
                      sadas('06/06/2022', '2')
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Lab Eng Software',
                      primaryLabel: 'Ausências: 4',
                      secondaryLabel: 'Maxímo: 20',
                      thirdlyLabel: '',
                      color: Colors.blue, 
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Met Pesquisa',
                      primaryLabel: 'Ausencias: 10',
                      secondaryLabel: 'Maxímo: 0',
                      thirdlyLabel: '',
                      color: Colors.brown,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('15/04/2022', '2'),
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Cálculo',
                      primaryLabel: 'Ausencias: 2',
                      secondaryLabel: 'Maxímo: 20',
                      thirdlyLabel: '',
                      color: Colors.green,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                      sadas('12/04/2022', '2'),
                      sadas('19/04/2022', '2'),
                      sadas('06/05/2022', '2'),
                      sadas('13/05/2022', '2'),
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Ingês V',
                      primaryLabel: 'Ausencias: 8',
                      secondaryLabel: 'Maxímo: 10',
                      thirdlyLabel: '',
                      color: AppColors.corRed,
                      onpressed: () {},
                    ),
                  ),
                  ExpansionTile(
                    children: [
                    ],
                    backgroundColor: Colors.white,
                    title: CardWidget(
                      iconAsset: AppImages.ausenciaGrand,
                      disciplinaName: 'Estrutura de Dados',
                      primaryLabel: 'Ausencias: 0',
                      secondaryLabel: 'Maxímo: 20',
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
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Text('${titulo}  ${nota}')
        ],
      ),
    );
  }
}
