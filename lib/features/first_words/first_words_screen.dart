import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class FirstWordsScreen extends StatefulWidget {
  const FirstWordsScreen({super.key});

  @override
  State<FirstWordsScreen> createState() => _FirstWordsScreenState();
}

class _FirstWordsScreenState extends State<FirstWordsScreen> {
  String _feedback = 'Tap a word and Lia will explain it in a simple way.';

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'First Words',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Let us learn first words.',
            description: 'Tap a word to hear a short and simple meaning.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ActionChip(
                label: const Text('Apple'),
                onPressed: () {
                  context.progress.completeLesson(
                    'first_words',
                    stars: 1,
                    badge: 'Word Starter',
                  );
                  setState(() {
                    _feedback = 'An apple is a fruit you can eat.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Ball'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A ball is round and fun to throw or roll.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Book'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A book has pages with stories or pictures.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Star'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A star shines in the sky at night.';
                  });
                },
              ),
            ],
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
