import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';

class GreetingsPage extends StatelessWidget {
  const GreetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 14 + MediaQuery.of(context).viewPadding.top),
            Image.asset(
              'assets/o4.png',
              height: 250,
            ),
            const SizedBox(height: 120),
            Text(
              'Nice to meet you!',
              style: TextStyle(
                color: AppColors.main50,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              myname,
              style: const TextStyle(
                color: AppColors.main,
                fontSize: 38,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: PrimaryButton(
                title: 'Start',
                onPressed: () {
                  context.go('/home');
                },
              ),
            ),
            SizedBox(height: 54 + MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }
}
