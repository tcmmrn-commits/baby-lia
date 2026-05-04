import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lesson_prompt_card.dart';
import '../../shared/widgets/screen_shell.dart';

class ListeningTimeScreen extends StatefulWidget {
  const ListeningTimeScreen({super.key});

  @override
  State<ListeningTimeScreen> createState() => _ListeningTimeScreenState();
}

class _ListeningTimeScreenState extends State<ListeningTimeScreen> {
  String? _feedback;

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Listening Time',
      child: ListView(
        children: [
          const LessonPromptCard(
            eyebrow: 'Lia says',
            title: 'Listen and choose the right answer.',
            description: 'Lia says: Which one is yellow?',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ActionChip(
                label: const Text('Banana'),
                onPressed: () {
                  context.progress.completeLesson(
                    'listening_time',
                    stars: 1,
                    badge: 'Good Listener',
                  );
                  setState(() {
                    _feedback = 'Yes. A banana is often yellow.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Cloud'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Nice try. A cloud is usually white.';
                  });
                },
              ),
              ActionChip(
                label: const Text('Grass'),
                onPressed: () {
                  setState(() {
                    _feedback = 'Nice try. Grass is usually green.';
                  });
                },
              ),
            ],
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
