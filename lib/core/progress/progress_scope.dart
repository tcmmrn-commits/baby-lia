import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'progress_controller.dart';

class ProgressScope extends StatelessWidget {
  final Widget child;

  const ProgressScope({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = ProgressController();
        controller.load();
        return controller;
      },
      child: child,
    );
  }
}
