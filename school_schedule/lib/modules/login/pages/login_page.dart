import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import 'create_account_page.dart';
import 'login_page_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    double heigthValue = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: heigthValue * 0.50,
              width: widthValue,
              color: Colors.white,
              child: SvgPicture.asset(
                AppImages.calendarioSVG,
                height: 100,
              )),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: AppColors.corPrimaria,
            ),
            height: heigthValue * 0.45,
            width: widthValue,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 49),
                  child: Text(
                    'Tenha controle das suas \ndisiplinas, notas, faltas e \n grade de horários na\n palma de sua mão',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(290, 50),
                      primary: AppColors.corDarkGray2,
                    ),
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccount()),
                      );
                    }),
                    child: const Text('Cadastra-se')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(290, 50),
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPageFirebase()),
                      );
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
