import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  String _feedback = 'Pick an animal to hear Lia describe it.';

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Animals',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Let us learn animal names.',
            description: 'Tap an animal and Lia will say something simple.',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ActionChip(
                label: const Text('Cat'),
                onPressed: () {
                  context.progress.completeLesson(
                    'animals',
                    stars: 1,
                    badge: 'Animal Friend',
                  );
                  setState(() {
                    _feedback = 'A cat is soft and says meow.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Dog'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A dog can bark and wag its tail.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Bird'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A bird can flap its wings and fly.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Fish'),
                onPressed: () {
                  setState(() {
                    _feedback = 'A fish swims in the water.';
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
