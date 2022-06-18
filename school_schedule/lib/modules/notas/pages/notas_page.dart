import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../shared/widgets/card_widget.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final tituloController = TextEditingController();
  final notaController = TextEditingController();
  final CollectionReference _disciplinas =
      FirebaseFirestore.instance.collection('disciplinas');
  final CollectionReference _notas =
      FirebaseFirestore.instance.collection('notas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notas'),
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
                      iconAsset: AppImages.disciplinasBrancoSVG,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Média: 10.0',
                      secondaryLabel: 'Total de notas: 1',
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
                      iconAsset: AppImages.disciplinasBrancoSVG,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Média: 10.0',
                      secondaryLabel: 'Total de notas: 1',
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
                      iconAsset: AppImages.disciplinasBrancoSVG,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Média: 10.0',
                      secondaryLabel: 'Total de notas: 1',
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
                      iconAsset: AppImages.disciplinasBrancoSVG,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Média: 10.0',
                      secondaryLabel: 'Total de notas: 1',
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
                      iconAsset: AppImages.disciplinasBrancoSVG,
                      disciplinaName: 'Eng.Software',
                      primaryLabel: 'Média: 10.0',
                      secondaryLabel: 'Total de notas: 1',
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

  Future<void> _create() async {
    final String? titulo = tituloController.text;
    final String? nota = notaController.text;

    await _notas.add({
      "discId": _disciplinas.doc,
      "nota": nota,
      "titulo": titulo,
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$titulo adicionada com sucesso')));
  }

  Widget _buildCard(Color color) {
    return GestureDetector(
      onTap: (() {
        return _displayTextInputDialog(context);
      }),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Container(
          height: 100,
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
                SvgPicture.asset(AppImages.notasCanetaSVG),
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
                      Text('Média: 10', style: TextStyle(fontSize: 12)),
                      Text('Total de notas: 3', style: TextStyle(fontSize: 12)),
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

  _displayTextInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: AppColors.corLightGray1,
            title: Text('Adicionar Notas'),
            content: Column(
              children: [
                TextField(
                  controller: tituloController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    prefixIconColor: Colors.red,
                    hintText: 'Titulo',
                    fillColor: AppColors.corGray,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: tituloController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    prefixIconColor: Colors.red,
                    hintText: 'Nota',
                    fillColor: AppColors.corGray,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _create();
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar')),
                  ],
                )
              ],
            ),
          );
        });
  }
}
