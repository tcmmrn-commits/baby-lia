import 'package:flutter/material.dart';

import '../../core/progress/progress_extensions.dart';
import '../../core/settings/parent_settings_extensions.dart';
import '../../shared/widgets/screen_shell.dart';

class ParentAreaScreen extends StatelessWidget {
  const ParentAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.watchProgress();
    final settings = context.watchParentSettings();

    return ScreenShell(
      title: 'Parent Area',
      child: ListView(
        children: [
          Text(
            'Learning Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Stars earned: ${progress.stars}'),
                  const SizedBox(height: 8),
                  Text('Badges earned: ${progress.earnedBadges.length}'),
                  const SizedBox(height: 8),
                  Text(
                    'Lessons completed: ${progress.completedLessons.length}',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'App Settings',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            value: settings.musicEnabled,
            onChanged: context.parentSettings.setMusicEnabled,
            title: const Text('Background Music'),
            subtitle: const Text('Play soft music during activities'),
          ),
          SwitchListTile(
            value: settings.voiceEnabled,
            onChanged: context.parentSettings.setVoiceEnabled,
            title: const Text('Lia Voice'),
            subtitle: const Text('Enable spoken feedback'),
          ),
          SwitchListTile(
            value: settings.showTextPrompts,
            onChanged: context.parentSettings.setShowTextPrompts,
            title: const Text('Text Prompts'),
            subtitle: const Text('Show simple text instructions'),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Session Length: ${settings.sessionLengthMinutes} minutes',
                  ),
                  const SizedBox(height: 12),
                  Slider(
                    value: settings.sessionLengthMinutes.toDouble(),
                    min: 5,
                    max: 20,
                    divisions: 3,
                    label: '${settings.sessionLengthMinutes} min',
                    onChanged: (value) {
                      context.parentSettings
                          .setSessionLengthMinutes(value.round());
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Safety Notes',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Baby Lia is designed for guided learning. Personal information, unsafe requests, and inappropriate topics should always be redirected.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
