import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule_debug_version/main.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';
import '../../../tela_em_desenvolvimento.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
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
            padding: const EdgeInsets.only(bottom: 18, top: 20, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      const Text('Nome do usuario',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Text(user!.email!,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500))
                    ],
                  ),
                )
              ],
            ),
          ),
          _buildCard(AppImages.calendarioSyncSVG, 'Sincronizar Calendário',
              'Tenha acesso aos eventos do calendário\ndo seu dispositivo aqui no aplicativo.',
              (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TelaEmDesenvolvimento()),
            );
          })),
          _buildCard(AppImages.emailSVG, 'Fale Conosco',
              'Mande suas duvidas e sugestões', (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TelaEmDesenvolvimento()),
            );
          })),
          _buildCard(AppImages.shieldSVG, 'Politica de privacdade', null, (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TelaEmDesenvolvimento()),
            );
          })),
          _buildCard(AppImages.aboutSVG, 'Sobre', null, (() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TelaEmDesenvolvimento()),
            );
          })),
          _buildCard(AppImages.aboutSVG, 'Logout', null, (() {
            _signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SplashScreen()),
            );
          }))
        ],
      ),
    );
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }

  Widget _buildCard(
      String asset, String title, String? subTitle, Function() ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.corPrimaria,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 18, 18, 18).withOpacity(0.28),
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
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
                          Container(
                            width: 230,
                            child: Text(
                              subTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
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
