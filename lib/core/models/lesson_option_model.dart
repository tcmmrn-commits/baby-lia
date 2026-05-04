import 'package:flutter/material.dart';

class LessonOptionModel {
  final String label;
  final bool isCorrect;
  final Color? color;

  const LessonOptionModel({
    required this.label,
    required this.isCorrect,
    this.color,
  });
}
