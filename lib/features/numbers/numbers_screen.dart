import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  String _feedback = 'Tap a number to practice counting.';

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Numbers',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Let us count from one to ten.',
            description: 'Tap a number and Lia will help you count to it.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              10,
              (index) {
                final value = index + 1;
                return ActionChip(
                  label: Text('$value'),
                  onPressed: () {
                    final countLine = List.generate(
                      value,
                      (i) => '${i + 1}',
                    ).join(', ');
                    if (value == 10) {
                      context.progress.completeLesson(
                        'numbers',
                        stars: 1,
                        badge: 'Counting Star',
                      );
                    }
                    setState(() {
                      _feedback = 'Lia counts: $countLine';
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          Text(
            _feedback,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
