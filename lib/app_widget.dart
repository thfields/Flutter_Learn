import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';
import 'package:hello_world/app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child){
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: AppController.instance.isDartTheme 
              ? Brightness.dark 
              : Brightness.light,
          ),
          home: HomePage(),
        );
    }
    
    );
  }

}