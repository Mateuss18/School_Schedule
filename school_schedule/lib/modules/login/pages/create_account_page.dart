import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule_debug_version/main.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import 'login_page_firebase.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _confirPassword = '';
  bool _firebaseError = false;
  String _firebaseMessage = '';

  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();
  final controllerName = TextEditingController();
  final controllerSecondSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    double heigthValue = MediaQuery.of(context).size.height;

    void _submitForm() async {
      try {
        if (_confirPassword != _password) {
          _firebaseError = true;
          _firebaseMessage = 'Senhas nao conferem';
        } else {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _email, password: _password);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPageFirebase()),
          );
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _firebaseError = true;
          if (e.code == 'weak-password') {
            _firebaseMessage = 'Senha muito fraca';
          } else if (e.code == 'email-already-in-use') {
            _firebaseMessage = 'Email ja esta em uso';
          } else if (e.code == 'invalid-email') {
            _firebaseMessage = 'Email invalido';
          }
        });
      } catch (e) {
        setState(() {
          _firebaseError = true;
          _firebaseMessage = 'Something went wrong.';
        });
        // ignore: avoid_print
        print(e);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 60.0, bottom: 5),
                  width: widthValue,
                  height: heigthValue * 0.30,
                  color: Colors.white,
                  child: SvgPicture.asset(AppImages.womanBooks,
                      height: 200, width: 200, fit: BoxFit.scaleDown)),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: AppColors.corPrimaria,
                ),
                height: heigthValue * 0.70,
                width: widthValue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Center(
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: controllerEmail,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.0,
                          ),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.corDarkGray1, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Senha',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          maxLength: 6,
                          controller: controllerSenha,
                          style: const TextStyle(
                            fontSize: 22,
                            height: 1.0,
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            counterText: '',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.corDarkGray1, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Confirmar senha',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 50,
                        child: TextField(
                          maxLength: 6,
                          controller: controllerSecondSenha,
                          style: const TextStyle(
                            fontSize: 22,
                            height: 1.0,
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            counterText: '',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.corDarkGray1, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          onChanged: (value) {
                            _confirPassword = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _firebaseError
                          ? Text(
                              _firebaseMessage,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : const Placeholder(
                              fallbackHeight: 0,
                            ),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(400, 50),
                              primary: AppColors.corDarkGray2,
                            ),
                            onPressed: () {
                              setState(() {
                                _firebaseError = false;
                              });
                              _submitForm();
                            },
                            child: const Text(
                              'Cadastrar-se',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Já tenho um cadastro. ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginPageFirebase()),
                              );
                            }),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: AppColors.corDarkGray2,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
