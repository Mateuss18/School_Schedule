import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../custom_icons.dart';
import '../../../shared/widgets/card_widget.dart';

class DisciplinasPage extends StatefulWidget {
  const DisciplinasPage({Key? key}) : super(key: key);

  @override
  State<DisciplinasPage> createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<DisciplinasPage> {
  final user = FirebaseAuth.instance.currentUser;
  final disciplinaController = TextEditingController();
  final professorController = TextEditingController();
  final salaController = TextEditingController();
  final faltasController = TextEditingController();
  final CollectionReference _disciplinas =
      FirebaseFirestore.instance.collection('disciplinas');

  Future<void> _create() async {
    final String? userid = user!.uid;
    final String? disciplina = disciplinaController.text;
    final String? professor = professorController.text;
    final String? sala = salaController.text;
    final String? faltas = faltasController.text;
    await _disciplinas.add({
      "id": userid,
      "nomeDisciplina": disciplina,
      "nomeProfessor": professor,
      "numeroDeFaltas": faltas,
      "sala": sala,
    });

    disciplinaController.text = '';
    professorController.text = '';
    salaController.text = '';
    faltasController.text = '';

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$disciplina adicionada com sucesso')));
  }

  Color pickerColor = const Color.fromARGB(255, 51, 253, 0);
  Color currentColor = const Color.fromARGB(255, 255, 0, 0);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(
      () => pickerColor = color,
    );
  }

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
      body: Column(
        children: [
          CardWidget(
            iconAsset: AppImages.disciplinasBrancoSVG,
            disciplinaName: 'Matematica',
            primaryLabel: 'Armando',
            secondaryLabel: 'Sala A4',
            thirdlyLabel: '12',
            color: AppColors.corRed,
            onpressed: () {
              _displayInformation(
                context,
                'Matematica',
                'Armando',
                'Sala a4',
                '12',
                '',
              );
            },
          ),
          CardWidget(
            iconAsset: AppImages.disciplinasBrancoSVG,
            disciplinaName: 'Eng.Software',
            primaryLabel: 'Kleber',
            secondaryLabel: 'Sala a11',
            thirdlyLabel: '8',
            color: Colors.pink,
            onpressed: () {
              _displayInformation(
                context,
                'Eng.Software',
                'Kleber',
                'Sala a11',
                '8',
                '',
              );
            },
          ),
          CardWidget(
            iconAsset: AppImages.disciplinasBrancoSVG,
            disciplinaName: 'Calculo',
            primaryLabel: 'Cabrini',
            secondaryLabel: 'Sala b8',
            thirdlyLabel: '4',
            color: Colors.blue,
            onpressed: () {
              _displayInformation(
                context,
                'Calculo',
                'Cabrini',
                'Sala b8',
                '4',
                '',
              );
            },
          ),
          CardWidget(
            iconAsset: AppImages.disciplinasBrancoSVG,
            disciplinaName: 'Estatistica',
            primaryLabel: 'Paula Tejando',
            secondaryLabel: 'Sala b5',
            thirdlyLabel: '12',
            color: Colors.green,
            onpressed: () {
              _displayInformation(
                context,
                'Estatistica',
                'Paula Tejando',
                'Sala b5',
                '12',
                '',
              );
            },
          ),
          CardWidget(
            iconAsset: AppImages.disciplinasBrancoSVG,
            disciplinaName: 'Estrutura de dados',
            primaryLabel: 'Toni',
            secondaryLabel: 'Sala A10',
            thirdlyLabel: '0',
            color: Colors.orange,
            onpressed: () {
              _displayInformation(
                context,
                'Estrutura de dados',
                'Toni',
                'Sala A10',
                '0',
                '',
              );
            },
          ),
        ],
      ),
    );
    // Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: AppColors.corPrimaria,
    //     title: const Text(
    //       'Disciplinas',
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   body: StreamBuilder(
    //     stream: _disciplinas.snapshots(),
    //     builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    //       if (streamSnapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: streamSnapshot.data!.docs.length,
    //           itemBuilder: (context, index) {
    //             final DocumentSnapshot documentSnapshot =
    //                 streamSnapshot.data!.docs[index];
    //             if (user!.uid == documentSnapshot['id']) {
    //               return CardWidget(
    //                 iconAsset: AppImages.disciplinasBrancoSVG,
    //                 textIcon1Asset: AppImages.capeloSVG,
    //                 textIcon2Asset: AppImages.ausenciaSVG,
    //                 textIcon3Asset: AppImages.salaSVG,
    //                 disciplinaName: documentSnapshot['nomeDisciplina'],
    //                 primaryLabel: documentSnapshot['nomeProfessor'],
    //                 secondaryLabel: documentSnapshot['sala'],
    //                 thirdlyLabel: documentSnapshot['numeroDeFaltas'],
    //                 color: Colors.red,
    //                 onpressed: () {
    //                   _displayInformation(
    //                     context,
    //                     documentSnapshot['nomeDisciplina'],
    //                     documentSnapshot['nomeProfessor'],
    //                     documentSnapshot['sala'],
    //                     documentSnapshot['numeroDeFaltas'],
    //                     documentSnapshot.id,
    //                   );
    //                 },
    //               );
    //             } else {
    //               return Container();
    //             }
    //           },
    //         );
    //       } else {
    //         return const Center(
    //           child: Text('Nenhuma disciplina adicionada'),
    //         );
    //       }
    //     },
    //   ),
    //   bottomSheet: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       IconButton(
    //         color: AppColors.corPrimaria,
    //         alignment: Alignment.center,
    //         onPressed: (() {
    //           _displayTextInputDialog(context, true, null);
    //         }),
    //         iconSize: 23,
    //         icon: const Icon(Icons.add),
    //       ),
    //     ],
    //   ),
    // );
  }

  _displayInformation(BuildContext context, String disciplina, String professor,
      String sala, String maxFaltas, String disciplinaID) {
    _disciplinas.snapshots();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Editar Disciplina',
              textAlign: TextAlign.center,
            ),
            scrollable: true,
            content: Column(
              children: [
                Row(
                  children: [Text(disciplina)],
                ),
                Row(
                  children: [Text(professor)],
                ),
                Row(
                  children: [Text(sala)],
                ),
                Row(
                  children: [Text(maxFaltas)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        _deleteDisciplinaDialog(context, disciplinaID);
                      },
                      icon: const Icon(
                        CustomIcons.iconTrash,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          _displayTextInputDialog(context, false, disciplinaID);
                        },
                        icon: const Icon(
                          CustomIcons.iconPencil,
                          color: AppColors.corPrimaria,
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }

  _deleteDisciplinaDialog(BuildContext context, String disciplinaID) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: AppColors.corLightGray1,
            title: const Text('Deseja apagar esta disciplina ?'),
            content: Column(
              children: [
                const Text(
                    'Ao fazer isso não sera mais possivel recuperar os dados da disciplina'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _deleteDisciplina(disciplinaID);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('Confirmar')),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Future<void> _deleteDisciplina(String disciplinaId) async {
    await _disciplinas.doc(disciplinaId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Disciplina deletada com sucesso')));
  }

  Future<void> _updateDisciplina(String disciplinaId) async {
    final String? disciplina = disciplinaController.text;
    final String? professor = professorController.text;
    final String? sala = salaController.text;
    final String? faltas = faltasController.text;
    await _disciplinas.doc(disciplinaId).update({
      "nomeDisciplina": disciplina,
      "nomeProfessor": professor,
      "numeroDeFaltas": faltas,
      "sala": sala
    });
    disciplinaController.text = '';
    professorController.text = '';
    salaController.text = '';
    faltasController.text = '';

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Disciplina editada com sucesso')));
  }

  _displayTextInputDialog(
      BuildContext context, bool createOrUpdate, String? disciplinaId) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: AppColors.corLightGray1,
            title: Text(
              createOrUpdate ? 'Adicionar disciplina' : 'Editar disciplina',
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
                TextField(
                  controller: disciplinaController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CustomIcons.iconBooks),
                    prefixIconColor: Colors.red,
                    hintText: 'Nome da disciplina',
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
                  controller: professorController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CustomIcons.iconHat),
                    hintText: 'Professor(a)',
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
                  controller: salaController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(CustomIcons.iconClass),
                    prefixIconColor: Colors.red,
                    hintText: 'Sala',
                    fillColor: AppColors.corGray,
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: faltasController,
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none),
                    prefixIcon: Icon(Icons.event_busy),
                    prefixIconColor: Colors.red,
                    hintText: 'Maximo de faltas',
                    fillColor: AppColors.corGray,
                    filled: true,
                  ),
                ),
                GestureDetector(
                  onTap: (() {}),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.color_lens,
                        color: AppColors.corPrimaria,
                      ),
                      const Expanded(child: Text('Adicione uma cor'))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          createOrUpdate
                              ? _create()
                              : _updateDisciplina(disciplinaId!);
                          Navigator.pop(context);
                        },
                        child: const Text('Salvar')),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
