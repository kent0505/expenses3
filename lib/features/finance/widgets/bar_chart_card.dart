import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class BarChartCard extends StatelessWidget {
  const BarChartCard({
    super.key,
    required this.title,
    required this.profitHeight,
    required this.lossHeight,
  });

  final String title;
  final double profitHeight;
  final double lossHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      // height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 5,
                height: profitHeight,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 5,
                height: lossHeight,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
