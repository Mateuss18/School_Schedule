import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/disciplina.dart';

class DisciplinaDb {
  final CollectionReference _disciplinas =
  FirebaseFirestore.instance.collection('disciplinas');

  Future<void> create(Disciplina disciplina) async {
    await _disciplinas.add(disciplina.toMap()).then((value) => print('criado: ${value.id}'));}

  Future<void> delete(String disciplinaId) async {
    await _disciplinas.doc(disciplinaId).delete();

    log('deletado: $disciplinaId');
  }
  Future<void> update(String disciplinaId, Disciplina disciplina) async {
    await _disciplinas.doc(disciplinaId).update(disciplina.toMap());
  }

  Stream<QuerySnapshot<Object?>> list(String userUUID) {
    final Query fromUser = _disciplinas.where("id", isEqualTo: userUUID);
    return fromUser.snapshots();
  }

 //  Future<Disciplina?> get(String disciplinaId) async {
 //    Disciplina? disciplina = Disciplina();
 //    var document = await _disciplinas.doc(disciplinaId).get().then((value) => {
 //      disciplina = Disciplina.fromMap(value.data().toString())
 //    }
 //    );
 // return Disciplina.fromMap(document.toString());
 //    return disciplina;
 //    // if (disciplina != null) {return Disciplina.fromJson(disciplina.toString());}
 //    // return null;
 //  }
}