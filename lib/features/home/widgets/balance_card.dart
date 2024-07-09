import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Balance',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '$myincome',
                style: const TextStyle(
                  color: AppColors.main,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'USD',
                style: TextStyle(
                  color: AppColors.black50,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFBold',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
