import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_schedule/core/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SvgPicture.asset(
          'https://icons8.com/icon/gKQ4INZChRxZ/svg',
          placeholderBuilder: (context) => Container(
            height: 23,
            width: 23,
          ),
        ));
  }
}
