import 'package:flutter/material.dart';

import '../../core/models/lesson_option_model.dart';
import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  String? _feedback;

  static const _options = <LessonOptionModel>[
    LessonOptionModel(
      label: 'Blue',
      color: Color(0xFF87CEFA),
      isCorrect: true,
    ),
    LessonOptionModel(
      label: 'Yellow',
      color: Color(0xFFFFE680),
      isCorrect: false,
    ),
    LessonOptionModel(
      label: 'Pink',
      color: Color(0xFFFFB8C8),
      isCorrect: false,
    ),
    LessonOptionModel(
      label: 'Mint',
      color: Color(0xFFC8F0D8),
      isCorrect: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Colors',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Can you find something blue?',
            description: 'Tap the color that matches the word blue.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _options
                .map(
                  (option) => _ColorTile(
                    label: option.label,
                    color: option.color!,
                    onTap: () {
                      if (option.isCorrect) {
                        context.progress.completeLesson(
                          'colors',
                          stars: 1,
                          badge: 'Color Finder',
                        );
                      }
                      setState(() {
                        _feedback = option.isCorrect
                            ? 'Great job. Blue is cool and bright.'
                            : 'Nice try. Let us look for blue again.';
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

class _ColorTile extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ColorTile({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: SizedBox(
          width: 140,
          height: 110,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
