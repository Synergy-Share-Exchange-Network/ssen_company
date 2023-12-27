import 'package:flutter/material.dart';
import 'package:ssen_company/intermediate.dart';
import 'package:ssen_company/services/app_routes.dart';
import 'package:ssen_company/services/theme/app_theme.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synergy Share Exchange Network',
      themeMode: ThemeMode.system,
      theme: SappTheme.lightTheme,
      darkTheme: SappTheme.darkTheme,
      home: Intermediate(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
