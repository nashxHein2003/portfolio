import 'package:flutter/material.dart';
import 'package:portfolio/styles/theme.dart';
import 'package:portfolio/screens/home/home_provider.dart';
import 'package:portfolio/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder:
        (BuildContext context, HomeProvider homeProvider, Widget? child) {
      return MaterialApp(
        builder: (context, child) =>
            ResponsiveBreakpoints.builder(breakpoints: const [
          Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
          Breakpoint(start: 361, end: 450, name: MOBILE),
          Breakpoint(start: 451, end: 800, name: TABLET),
          Breakpoint(start: 801, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ], child: child!),
        home: const HomeScreen(),
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: homeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
