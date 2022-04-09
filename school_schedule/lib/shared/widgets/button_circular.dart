import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class ButtonCircular extends StatelessWidget {
  const ButtonCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: AppColors.corPrimaria,
      ),
      height: 110,
      width: 110,
    );
  }
}
