import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class BodyPartsScreen extends StatefulWidget {
  const BodyPartsScreen({super.key});

  @override
  State<BodyPartsScreen> createState() => _BodyPartsScreenState();
}

class _BodyPartsScreenState extends State<BodyPartsScreen> {
  String _feedback = 'Tap a body part to hear Lia explain it.';

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Body Parts',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Let us learn body parts.',
            description: 'Tap a body part and Lia will help you name it.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ActionChip(
                label: const Text('Eyes'),
                onPressed: () {
                  context.progress.completeLesson(
                    'body_parts',
                    stars: 1,
                    badge: 'Body Explorer',
                  );
                  setState(() {
                    _feedback = 'Eyes help us see colors and shapes.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Ears'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Ears help us hear music and voices.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Hands'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Hands help us wave, hold, and clap.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Feet'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Feet help us stand, walk, and jump.';
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
