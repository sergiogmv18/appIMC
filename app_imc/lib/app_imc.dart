import 'package:app_imc/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CalculatorIMC extends StatelessWidget {
  const CalculatorIMC({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'imc calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home:const HomeScreen(),
    );
  }
}