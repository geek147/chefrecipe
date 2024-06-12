import 'package:chefrecipe/feature/home/presentation/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme.dart';
import 'injection.dart' as di;
import 'package:flutter_gemini/flutter_gemini.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Gemini.init(
      apiKey: const String.fromEnvironment('apiKey'), enableDebugging: true);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chef Recipe',
        theme: AppTheme.lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
