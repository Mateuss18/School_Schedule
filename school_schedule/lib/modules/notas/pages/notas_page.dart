import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  final _disciplinas = FirebaseFirestore.instance
      .collection('disciplinas')
      .doc('8M5LjeqIrYotljipq6sA')
      .collection('notas')
      .doc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notas'),
        ),
        body: Column(
          children: [
            _buildCard(Colors.blue),
          ],
        ));
  }

  Widget _buildCard(Color color) {
    return GestureDetector(
      onTap: (() {
        // ignore: avoid_print

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
                      Text('M??dia: 10', style: TextStyle(fontSize: 12)),
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

  String _chosenValue = 'I\'m not able to help';
  _displayTextInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return AlertDialog(
              scrollable: true,
              backgroundColor: AppColors.corLightGray1,
              title: Text('Adicionar Disciplinas'),
              content: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DropdownButton<String>(
                        value: _chosenValue,
                        underline: Container(),
                        items: <String>[
                          'I\'m not able to help',
                          'Unclear description',
                          'Not available at set date and time',
                          'Other'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _chosenValue = value!;
                          });
                        }),
                  ),
                  TextField(
                    controller: controller1,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.book),
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
                    controller: controller2,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.book),
                      prefixIconColor: Colors.red,
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
                    controller: controller3,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.book),
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
                    controller: controller4,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.book),
                      prefixIconColor: Colors.red,
                      hintText: 'Maximo de faltas',
                      fillColor: AppColors.corGray,
                      filled: true,
                    ),
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
                          onPressed: () {}, child: const Text('Salvar')),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}
