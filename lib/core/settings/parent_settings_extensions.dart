import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'parent_settings_controller.dart';

extension ParentSettingsBuildContext on BuildContext {
  ParentSettingsController get parentSettings =>
      read<ParentSettingsController>();
  ParentSettingsController watchParentSettings() =>
      watch<ParentSettingsController>();
}
