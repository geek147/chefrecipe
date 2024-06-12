import 'package:chefrecipe/core/utils/env.dart';
import 'package:chefrecipe/feature/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme.dart';
import 'injection.dart' as di;
import 'package:flutter_gemini/flutter_gemini.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // gemini init
  Gemini.init(apiKey: Env.apiKey, enableDebugging: true);
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
        home: const MainPage(),
      ),
    );
  }
}
