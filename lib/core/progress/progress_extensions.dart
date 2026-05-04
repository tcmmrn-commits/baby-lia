import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'progress_controller.dart';

extension ProgressBuildContext on BuildContext {
  ProgressController get progress => read<ProgressController>();
  ProgressController watchProgress() => watch<ProgressController>();
}
