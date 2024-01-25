import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/flavours/app_flavour.dart';
import 'app/view/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  bootstrap(() => const AppBlocProvider());
}
