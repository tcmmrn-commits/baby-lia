import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lia_avatar.dart';
import '../../shared/widgets/screen_shell.dart';
import 'talk_controller.dart';

class TalkScreen extends StatefulWidget {
  const TalkScreen({super.key});

  @override
  State<TalkScreen> createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  final _controller = LiaTalkController();
  late LiaTalkState _state;
  final Set<String> _awardedLessons = <String>{};

  @override
  void initState() {
    super.initState();
    _state = _controller.initialState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Talk with Lia',
      child: ListView(
        children: [
          const LiaAvatar(),
          const SizedBox(height: 20),
          Text(
            _state.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                _state.reply,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _state.suggestions.map((item) {
              return ChoiceChip(
                label: Text(item.label),
                selected: false,
                onSelected: (_) {
                  setState(() {
                    _state = _controller.respond(_state, item.actionId);
                    final completedLessonId = _state.completedLessonId;
                    if (_state.completed &&
                        completedLessonId != null &&
                        !_awardedLessons.contains(completedLessonId)) {
                      _awardedLessons.add(completedLessonId);
                      context.progress.completeLesson(
                        completedLessonId,
                        stars: 1,
                        badge: _state.completedBadge,
                      );
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
