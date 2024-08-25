import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro/screens/home_screen.dart';

// https://www.behance.net/gallery/98918603/POMO-UIKIT
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        canvasColor: const Color(0xFFE7626C),
        cardColor: const Color(0xFFF4EDDB),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFFF4EDDB),
            fontSize: 89,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: TextStyle(
            color: Color(0xFF232B55),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          labelLarge: TextStyle(
            color: Color(0xFF232B55),
            fontSize: 58,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
