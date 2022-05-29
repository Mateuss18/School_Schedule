import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../custom_icons.dart';
import '../../../shared/widgets/card_widget.dart';
import '../database/disciplina_repository.dart';
import '../model/disciplina.dart';

class DisciplinasPage extends StatefulWidget {
  const DisciplinasPage({Key? key}) : super(key: key);

  @override
  State<DisciplinasPage> createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<DisciplinasPage> {
  final user = FirebaseAuth.instance.currentUser;
  final repository = DisciplinaDb();

  final selectedDisciplina = null;


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
      body: StreamBuilder(
        stream: repository.list(user!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                var disciplinaAtual = Disciplina(
                  id: documentSnapshot.reference.id,
                  userId: documentSnapshot['id'],
                  nomeDisciplina: documentSnapshot['nomeDisciplina'],
                  nomeProfessor: documentSnapshot['nomeProfessor'],
                  sala: documentSnapshot['sala'],
                  numeroDeFaltas: documentSnapshot['numeroDeFaltas'],
                );
                  return CardWidget(
                    iconAsset: AppImages.disciplinasBrancoSVG,
                    textIcon1Asset: AppImages.capeloSVG,
                    textIcon2Asset: AppImages.ausenciaSVG,
                    textIcon3Asset: AppImages.salaSVG,
                    disciplinaName: disciplinaAtual.nomeDisciplina!,
                    primaryLabel: disciplinaAtual.nomeProfessor!,
                    secondaryLabel: disciplinaAtual.sala!,
                    thirdlyLabel: '${disciplinaAtual.numeroDeFaltas!}',
                    color: Colors.red,
                    onpressed: () {
                      _displayInformation(
                        context,
                        disciplinaAtual
                      );
                    },
                  );
                }
            );
          } else {
            return const Center(
              child: Text('Nenhuma disciplina adicionada'),
            );
          }
        },
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: AppColors.corPrimaria,
            alignment: Alignment.center,
            onPressed: (() {
              _displayTextInputDialog(context, true, null);
            }),
            iconSize: 23,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  _displayInformation(BuildContext context, Disciplina disciplina) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Editar Disciplina', textAlign: TextAlign.center,),
            scrollable: true,
            content: Column(
              children: [
                Row(
                  children: [Text(disciplina.nomeDisciplina!)],
                ),
                Row(
                  children: [Text(disciplina.nomeProfessor!)],
                ),
                Row(
                  children: [Text(disciplina.sala!)],
                ),
                Row(
                  children: [Text(disciplina.numeroDeFaltas!.toString())],
                ),
                Row(
                  children: [Text(disciplina.id!)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        _deleteDisciplinaDialog(context, disciplina.id!);
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
                          _displayTextInputDialog(context, false, disciplina);
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
                          repository.delete(disciplinaID);
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


  _displayTextInputDialog(
      BuildContext context, bool createOrUpdate, Disciplina? disciplina) {
    var disciplinaAtual = disciplina ?? Disciplina(userId: user?.uid);
    var isEditing = disciplina != null;
    print(disciplinaAtual.toJson());
    print(isEditing.toString());
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            backgroundColor: AppColors.corLightGray1,
            title: Text(
                createOrUpdate ? 'Adicionar disciplina' : 'Editar disciplina', textAlign: TextAlign.center,),
            content: Column(
              children: [
                TextField(
                  controller: TextEditingController(text: isEditing? disciplinaAtual.nomeDisciplina : ''),
                  onChanged: (value) {disciplinaAtual.nomeDisciplina = value;},
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
                  controller: TextEditingController(text: isEditing? disciplinaAtual.nomeProfessor! : ''),
                  onChanged: (value) {disciplinaAtual.nomeProfessor = value;},
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
                  controller: TextEditingController(text: isEditing? disciplinaAtual.sala! : ''),
                  onChanged: (value) {disciplinaAtual.sala = value;},
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
                  controller: TextEditingController(text: isEditing? disciplinaAtual.numeroDeFaltas.toString() : ''),
                  onChanged: (value) {disciplinaAtual.numeroDeFaltas = int.parse(value) ;},
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
                  onTap: (() { }),
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
                              ? repository.create(disciplinaAtual)
                              : repository.update(disciplinaAtual.id!, disciplinaAtual);
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
