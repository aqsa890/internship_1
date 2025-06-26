import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(const App());
}
