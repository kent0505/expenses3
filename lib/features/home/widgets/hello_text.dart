import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, ',
          style: TextStyle(
            color: AppColors.main50,
            fontSize: 20,
          ),
        ),
        Text(
          myname.isNotEmpty ? myname : 'Steve',
          style: const TextStyle(
            color: AppColors.main,
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
