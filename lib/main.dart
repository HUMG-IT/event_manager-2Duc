import 'package:event_manager/event/event_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'event/event_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: <LocalizationsDelegate>[
        AppLocalizations.delegate,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3289134382.
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        locale('vi'),
        locale('en'),
      ],
      locale: Locale('vi'), // Ngôn ngữ mặc định
      home: EventView(),
    );
  }
}
