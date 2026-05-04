import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class FeelingsScreen extends StatefulWidget {
  const FeelingsScreen({super.key});

  @override
  State<FeelingsScreen> createState() => _FeelingsScreenState();
}

class _FeelingsScreenState extends State<FeelingsScreen> {
  String _feedback = 'Pick a feeling to see Lia respond.';

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Feelings',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'How do you feel today?',
            description: 'Choose a feeling and Lia will answer kindly.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ActionChip(
                label: const Text('Happy'),
                onPressed: () {
                  context.progress.completeLesson(
                    'feelings',
                    stars: 1,
                    badge: 'Kind Heart',
                  );
                  setState(() {
                    _feedback =
                        'Happy is a bright feeling. I am glad to hear it.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Sleepy'),
                onPressed: () {
                  setState(() {
                    _feedback =
                        'Sleepy means your body wants rest. A soft breath can help.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Excited'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Excited means something feels fun and big.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Calm'),
                onPressed: () {
                  setState(() {
                    _feedback =
                        'Calm feels quiet and peaceful. That is a lovely feeling.';
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
