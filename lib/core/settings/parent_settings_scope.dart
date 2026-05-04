import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'parent_settings_controller.dart';

class ParentSettingsScope extends StatelessWidget {
  final Widget child;

  const ParentSettingsScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = ParentSettingsController();
        controller.load();
        return controller;
      },
      child: child,
    );
  }
}
