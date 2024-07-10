import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 17),
            Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                color: title == 'Profit'
                    ? AppColors.main
                    : title == 'Loss'
                        ? AppColors.red
                        : const Color(0xff672CA3),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            if (title == 'Loss') ...[
              const Spacer(),
              const Text(
                'Last week expenses',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 17),
            ]
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 1,
          margin: const EdgeInsets.symmetric(horizontal: 17),
          color: title == 'Profit'
              ? AppColors.main
              : title == 'Loss'
                  ? AppColors.red
                  : const Color(0xff672CA3),
        ),
      ],
    );
  }
}
