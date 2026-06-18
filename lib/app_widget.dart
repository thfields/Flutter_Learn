import 'package:flutter/material.dart';
import 'package:flutter_learn/home_page.dart';
import 'package:flutter_learn/app_controller.dart';
import 'package:flutter_learn/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        final isDark = AppController.instance.isDartTheme;
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const LoginPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}