import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.main,
          fontSize: 24,
        ),
      ),
    );
  }
}
