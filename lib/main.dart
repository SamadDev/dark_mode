import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedproject/DarkMode.dart';
import 'package:sharedproject/drewer1.dart';
import 'package:sharedproject/style.dart';

void main() {
  runApp(ProviderWidget());
}

class ProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: DarkThemePreference())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: DarkThemePreference.darkTheme
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
      home: DrawerRa(),
    );
  }
}
