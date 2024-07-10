import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class MoneyPieChart extends StatelessWidget {
  const MoneyPieChart({
    super.key,
    required this.profit,
    required this.loss,
    required this.total,
  });

  final int profit;
  final int loss;
  final int total;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 320,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 80,
                sections: [
                  PieChartSectionData(
                    value: total.toDouble(),
                    color: const Color(0xff672CA3),
                    radius: 80,
                    title: '$total\$',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    // showTitle: false,
                  ),
                  PieChartSectionData(
                    value: loss.toDouble(),
                    color: AppColors.red,
                    radius: 80,
                    title: '$loss\$',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    // showTitle: false,
                  ),
                  PieChartSectionData(
                    value: profit.toDouble(),
                    color: AppColors.main,
                    radius: 80,
                    title: '$profit\$',
                    titleStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    // showTitle: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 400,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Circle(title: 'Profit'),
                _Circle(title: 'Loss'),
                _Circle(title: 'Total'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}
