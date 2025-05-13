import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/themes.dart';
import 'state/theme_provider.dart';
import 'screens/login_screen.dart';

class CheckMeApp extends ConsumerWidget {
  const CheckMeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CheckMe - Todo App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const LoginScreen(),
    );
  }
}
