import 'package:flutter/services.dart';

import 'app_colors.dart';

class Constants {
  static const textIntroDesc1 = 'teste1';
  static const textIntroDesc2 = 'teste2';
  static const textIntro = 'teste';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: AppColors.corPrimaria,
      statusBarIconBrightness: Brightness.dark);

  static const signInNavigate = '/sign-in';
  static const homeNavigate = '/home';
}
