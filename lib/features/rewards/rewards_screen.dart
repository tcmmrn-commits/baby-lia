import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/reward_badge.dart';
import '../../shared/widgets/screen_shell.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watchProgress();

    return ScreenShell(
      title: 'Rewards',
      child: ListView(
        children: [
          Text(
            'You have earned ${progress.stars} stars and ${progress.earnedBadges.length} badges.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: progress.earnedBadges
                .map((badge) => RewardBadge(label: badge))
                .toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Completed Lessons',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          if (progress.completedLessons.isEmpty)
            const Text('No lessons completed yet. Try one with Lia.')
          else
            ...progress.completedLessons.map(
              (lesson) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.star_rounded),
                title: Text(lesson.replaceAll('_', ' ')),
              ),
            ),
        ],
      ),
    );
  }
}
