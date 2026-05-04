import 'package:flutter/material.dart';

import '../features/animals/animals_screen.dart';
import '../features/body_parts/body_parts_screen.dart';
import '../features/colors/colors_screen.dart';
import '../features/feelings/feelings_screen.dart';
import '../features/first_words/first_words_screen.dart';
import '../features/home/home_screen.dart';
import '../features/listening_time/listening_time_screen.dart';
import '../features/numbers/numbers_screen.dart';
import '../features/parent_area/parent_area_screen.dart';
import '../features/parent_area/parent_gate_screen.dart';
import '../features/rewards/rewards_screen.dart';
import '../features/shapes/shapes_screen.dart';
import '../features/talk/talk_screen.dart';
import '../features/welcome/welcome_screen.dart';

abstract final class AppRoutes {
  static const welcome = '/';
  static const home = '/home';
  static const talk = '/talk';
  static const colors = '/colors';
  static const numbers = '/numbers';
  static const shapes = '/shapes';
  static const feelings = '/feelings';
  static const animals = '/animals';
  static const bodyParts = '/body-parts';
  static const firstWords = '/first-words';
  static const listeningTime = '/listening-time';
  static const rewards = '/rewards';
  static const parentGate = '/parent-gate';
  static const parentArea = '/parent-area';
}

Map<String, WidgetBuilder> buildRoutes() {
  return {
    AppRoutes.welcome: (_) => const WelcomeScreen(),
    AppRoutes.home: (_) => const HomeScreen(),
    AppRoutes.talk: (_) => const TalkScreen(),
    AppRoutes.colors: (_) => const ColorsScreen(),
    AppRoutes.numbers: (_) => const NumbersScreen(),
    AppRoutes.shapes: (_) => const ShapesScreen(),
    AppRoutes.feelings: (_) => const FeelingsScreen(),
    AppRoutes.animals: (_) => const AnimalsScreen(),
    AppRoutes.bodyParts: (_) => const BodyPartsScreen(),
    AppRoutes.firstWords: (_) => const FirstWordsScreen(),
    AppRoutes.listeningTime: (_) => const ListeningTimeScreen(),
    AppRoutes.rewards: (_) => const RewardsScreen(),
    AppRoutes.parentGate: (_) => const ParentGateScreen(),
    AppRoutes.parentArea: (_) => const ParentAreaScreen(),
  };
}
