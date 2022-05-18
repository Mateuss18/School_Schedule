import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule_debug_version/modules/home/pages/home_page.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import 'create_account_page.dart';

class LoginPageFirebase extends StatefulWidget {
  const LoginPageFirebase({Key? key}) : super(key: key);

  @override
  State<LoginPageFirebase> createState() => _LoginPageFirebaseState();
}

class _LoginPageFirebaseState extends State<LoginPageFirebase> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _firebaseError = false;
  String _firebaseMessage = '';
  final controllerEmail = TextEditingController();
  final controllerSenha = TextEditingController();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerSenha.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    double heigthValue = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 60.0, bottom: 5),
                  height: heigthValue * 0.4,
                  width: widthValue,
                  color: Colors.white,
                  child: Container(
                    child: SvgPicture.asset(AppImages.womanBooks,
                        height: 90, width: 90, fit: BoxFit.scaleDown),
                  )),
              Container(
                height: heigthValue * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: AppColors.corPrimaria,
                ),
                width: widthValue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                        height: 15,
                      ),
                      if (_firebaseError == true)
                         Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 1),
                            alignment: Alignment.center,
                            width: 222,
                            height: 23,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppImages.xCircle),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                      _firebaseMessage,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 251, 54, 54),
                                      ),
                                    ),
                                ),
                              ],
                            ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            }),
                            child: const Text(
                              'Esqueceu a senha?',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
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
                              singIn();
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sou um novo usario ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccount()),
                              );
                            }),
                            child: const Text(
                              'Cadastrar-se',
                              // ignore: unnecessary_const
                              style: const TextStyle(
                                  color: AppColors.corDarkGray2,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15),
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

  void singIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      if (userCredential.user != null && userCredential.user!.email != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _firebaseError = true;
      });
      if (e.code == 'user-not-found') {
        _firebaseMessage = 'Email incorreto ou inexistente.';
      } else if (e.code == 'wrong-password') {
        _firebaseMessage = 'Senha incorreta.';
      }
    } catch (e) {
      setState(() {
        _firebaseError = true;
        _firebaseMessage = 'Something went wrong.';
      });
      print(e);
    }
  }
}
