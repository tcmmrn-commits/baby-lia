import 'app/app.dart';
import 'core/progress/progress_scope.dart';
import 'core/settings/parent_settings_scope.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ParentSettingsScope(
      child: ProgressScope(
        child: BabyLiaApp(),
      ),
    ),
  );
}
