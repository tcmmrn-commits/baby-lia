import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/app_theme.dart';

class BabyLiaApp extends StatelessWidget {
  const BabyLiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Lia',
      debugShowCheckedModeBanner: false,
      theme: buildBabyLiaTheme(),
      initialRoute: AppRoutes.welcome,
      routes: buildRoutes(),
    );
  }
}
