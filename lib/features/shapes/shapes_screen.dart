import 'package:flutter/material.dart';

import '../../core/models/lesson_option_model.dart';
import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  String? _feedback;

  static const _options = <LessonOptionModel>[
    LessonOptionModel(label: 'Circle', isCorrect: true),
    LessonOptionModel(label: 'Square', isCorrect: false),
    LessonOptionModel(label: 'Triangle', isCorrect: false),
    LessonOptionModel(label: 'Star', isCorrect: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Shapes',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Which shape is a circle?',
            description: 'A circle is round with no corners.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _options
                .map(
                  (option) => ActionChip(
                    label: Text(option.label),
                    onPressed: () {
                      if (option.isCorrect) {
                        context.progress.completeLesson(
                          'shapes',
                          stars: 1,
                          badge: 'Shape Spotter',
                        );
                      }
                      setState(() {
                        _feedback = option.isCorrect
                            ? 'Yes. A circle is smooth and round.'
                            : 'Good try. A circle has no corners.';
                      });
                    },
                  ),
                )
                .toList(),
          ),
          if (_feedback != null) ...[
            const SizedBox(height: 18),
            Text(
              _feedback!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
