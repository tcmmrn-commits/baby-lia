import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../core/models/lesson_card_model.dart';
import '../../core/progress/progress_extensions.dart';
import '../../shared/widgets/lia_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _cards = <LessonCardModel>[
    LessonCardModel(
      title: 'Talk with Lia',
      subtitle: 'Short safe guided conversation',
      route: AppRoutes.talk,
    ),
    LessonCardModel(
      title: 'Colors',
      subtitle: 'Learn bright and simple colors',
      route: AppRoutes.colors,
    ),
    LessonCardModel(
      title: 'Numbers',
      subtitle: 'Count from one to ten',
      route: AppRoutes.numbers,
    ),
    LessonCardModel(
      title: 'Shapes',
      subtitle: 'Find circles, stars, and more',
      route: AppRoutes.shapes,
    ),
    LessonCardModel(
      title: 'Feelings',
      subtitle: 'Practice simple emotions',
      route: AppRoutes.feelings,
    ),
    LessonCardModel(
      title: 'Animals',
      subtitle: 'Learn animal names and simple facts',
      route: AppRoutes.animals,
    ),
    LessonCardModel(
      title: 'Body Parts',
      subtitle: 'Name simple body parts with Lia',
      route: AppRoutes.bodyParts,
    ),
    LessonCardModel(
      title: 'First Words',
      subtitle: 'Learn simple everyday words',
      route: AppRoutes.firstWords,
    ),
    LessonCardModel(
      title: 'Listening Time',
      subtitle: 'Hear a clue and choose the right answer',
      route: AppRoutes.listeningTime,
    ),
    LessonCardModel(
      title: 'Rewards',
      subtitle: 'See your stars and badges',
      route: AppRoutes.rewards,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final progress = context.watchProgress();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Lia'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF8F1), Color(0xFFF8FCFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFE3C8),
                      Color(0xFFFFD9E6),
                      Color(0xFFDDF2FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    const LiaAvatar(size: 94),
                    const SizedBox(height: 14),
                    Text(
                      'Hi, I am Lia. What would you like to learn today?',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Pick a short activity and earn stars while you learn.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.4,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      label: 'Stars',
                      value: '${progress.stars}',
                      color: const Color(0xFFFFE58A),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      label: 'Lessons',
                      value: '${progress.completedLessons.length}',
                      color: const Color(0xFFCDEFD9),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _SummaryCard(
                      label: 'Badges',
                      value: '${progress.earnedBadges.length}',
                      color: const Color(0xFFD6EBFF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0C7),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(Icons.chat_bubble_outline_rounded),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Featured Today',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Try a guided talk with Lia and earn a badge.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, AppRoutes.talk),
                        child: const Text('Open'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Learning Activities',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.96,
                ),
                itemBuilder: (context, index) {
                  final card = _cards[index];
                  return _HomeLessonCard(
                    title: card.title,
                    subtitle: card.subtitle,
                    onTap: () => Navigator.pushNamed(context, card.route),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class _HomeLessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HomeLessonCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0C7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.auto_awesome_rounded),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        height: 1.35,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
