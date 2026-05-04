import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressController extends ChangeNotifier {
  static const _starsKey = 'progress_stars';
  static const _completedLessonsKey = 'progress_completed_lessons';
  static const _earnedBadgesKey = 'progress_earned_badges';

  int _stars = 0;
  final Set<String> _completedLessons = <String>{};
  final Set<String> _earnedBadges = <String>{'Daily Smile'};

  int get stars => _stars;
  List<String> get completedLessons => _completedLessons.toList()..sort();
  List<String> get earnedBadges => _earnedBadges.toList()..sort();

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _stars = prefs.getInt(_starsKey) ?? 0;
    _completedLessons
      ..clear()
      ..addAll(prefs.getStringList(_completedLessonsKey) ?? const <String>[]);
    _earnedBadges
      ..clear()
      ..addAll(
        prefs.getStringList(_earnedBadgesKey) ?? const <String>['Daily Smile'],
      );
    if (_earnedBadges.isEmpty) {
      _earnedBadges.add('Daily Smile');
    }
    notifyListeners();
  }

  void completeLesson(String lessonId, {int stars = 1, String? badge}) {
    final isNewLesson = _completedLessons.add(lessonId);
    if (isNewLesson) {
      _stars += stars;
    }
    if (badge != null && badge.trim().isNotEmpty) {
      _earnedBadges.add(badge.trim());
    }
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_starsKey, _stars);
    await prefs.setStringList(_completedLessonsKey, completedLessons);
    await prefs.setStringList(_earnedBadgesKey, earnedBadges);
  }
}
