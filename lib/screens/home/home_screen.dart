import 'package:flutter/material.dart';
import 'package:portfolio/screens/welcome/welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WelcomeScreen());
  }
}
