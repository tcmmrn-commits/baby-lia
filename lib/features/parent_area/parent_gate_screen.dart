import 'package:flutter/material.dart';

import '../../app/router.dart';
import '../../shared/widgets/screen_shell.dart';

class ParentGateScreen extends StatelessWidget {
  const ParentGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenShell(
      title: 'Parent Gate',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tap the button below to enter the parent area.'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              AppRoutes.parentArea,
            ),
            child: const Text('I am a parent'),
          ),
        ],
      ),
    );
  }
}
