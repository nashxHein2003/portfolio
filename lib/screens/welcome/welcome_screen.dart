import 'package:flutter/material.dart';
import 'package:portfolio/extensions/context_extension.dart';
import 'package:portfolio/screens/home/home_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
          ),
          Positioned(
              top: 20,
              right: 20,
              child: Row(
                children: [
                  const Icon(Icons.light_mode),
                  Switch(
                      value: context.watch<HomeProvider>().isDarkMode,
                      onChanged: (val) {
                        context.read<HomeProvider>().updateTheme(val);
                      }),
                  const Icon(Icons.dark_mode),
                ],
              )),
          Center(
            child: SizedBox(
              height: context.screenHeight * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Thu Rain Hein',
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    "I'm Mobile Developer specialized in Flutter",
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
