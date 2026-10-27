import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({required this.onContinue, super.key});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InkWell(
            onTap: onContinue,
            borderRadius: BorderRadius.circular(28),
            child: const Padding(
              padding: EdgeInsets.all(36),
              child: BrandMark(size: 58),
            ),
          ),
        ),
      ),
    );
  }
}
