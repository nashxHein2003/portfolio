import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/context_extension.dart';
import 'package:portfolio/screens/home/home_provider.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/utils/size.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  bool isExpanded = false;

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
    _startTextAnimation();
  }

  void _startTextAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    });
  }

  void _stopTextAnimation() {
    _timer?.cancel();
    _animationController.value = 1.0;
  }

  void toggleSheet() {
    setState(() {
      isExpanded = !isExpanded;
    });
    if (isExpanded) {
      _stopTextAnimation();
    } else {
      _startTextAnimation();
    }

    sheetController.animateTo(
      isExpanded ? 0.9 : 0.08,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _stopTextAnimation();
    _animationController.dispose();
    super.dispose();
  }

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
            top: AppSize.s_20,
            right: AppSize.s_20,
            child: Row(
              children: [
                const Icon(Icons.light_mode),
                Switch(
                  value: context.watch<HomeProvider>().isDarkMode,
                  onChanged: (val) {
                    context.read<HomeProvider>().updateTheme(val);
                  },
                ),
                const Icon(Icons.dark_mode),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: context.screenHeight * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppString.name,
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 20),
                  Text(
                    AppString.subTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: DraggableScrollableSheet(
                  controller: sheetController,
                  minChildSize: 0.01,
                  maxChildSize: 1,
                  initialChildSize: 0.08,
                  builder: (BuildContext context, scrollController) {
                    return Container(
                      color: Colors.white,
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverList.list(children: [
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                              child: FilledButton.tonal(
                                onPressed: toggleSheet,
                                style:
                                    Theme.of(context).filledButtonTheme.style,
                                child: AnimatedBuilder(
                                  animation: _animationController,
                                  builder: (context, child) {
                                    return ScaleTransition(
                                      scale: _scaleAnimation,
                                      child: Opacity(
                                        opacity: _opacityAnimation.value,
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              Icon(
                                                isExpanded
                                                    ? Icons
                                                        .keyboard_double_arrow_down_rounded
                                                    : Icons
                                                        .keyboard_double_arrow_up,
                                                color: AppColor.kGrey,
                                              ),
                                              Text(
                                                isExpanded
                                                    ? AppString.close
                                                    : AppString.pressHere,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const ListTile(title: Text('Jane Doe')),
                            const ListTile(title: Text('Jack Reacher')),
                          ])
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
