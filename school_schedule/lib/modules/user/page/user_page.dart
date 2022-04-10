import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/core/app_images.dart';

import '../../../tela_em_desenvolvimento.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User? result = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.corLightGray1,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: _buildTile(),
    );
  }

  Widget _buildTile() {
    return Container(
      color: AppColors.corLightGray1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue),
                  child: SvgPicture.asset(
                    AppImages.iconUserBigSVG,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Nome do usuario', style: TextStyle(fontSize: 18)),
                      const Text('email@gmail.com', style: TextStyle(fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
          ),
          _buildCard(AppImages.calendarioSyncSVG, 'Sincronizar Calendário',
              'Tenha acesso aos eventos do calendário\n do seu dispositivo aqui no aplicativo.'),
          _buildCard(AppImages.emailSVG, 'Fale Conosco',
              'Mande suas duvidas e sugestões'),
          _buildCard(AppImages.shieldSVG, 'Politica de privacdade', null),
          _buildCard(AppImages.aboutSVG, 'Sobre', null),
        ],
      ),
    );
  }

  Widget _buildCard(String asset, String title, String? subTitle) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const TelaEmDesenvolvimento()),
        );
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.corPrimaria,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                SvgPicture.asset(
                  asset,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (subTitle != null)
                        Wrap(children: [
                          Text(
                            subTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ]),
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
}
