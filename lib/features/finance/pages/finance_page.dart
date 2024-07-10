import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/page_title.dart';
import '../../money/models/money.dart';
import '../widgets/bar_chart_card.dart';
import '../widgets/line_widget.dart';
import '../widgets/money_pie_chart.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  int profit = 0;
  int loss = 0;
  int total = 0;

  void getMyMoneys() {
    for (Money money in getLastWeekMoneys()) {
      if (money.profit) {
        profit = profit + money.amount;
      } else {
        loss = loss + money.amount;
      }
    }
    total = profit + loss;
    calculateExpenses();
  }

  @override
  void initState() {
    super.initState();
    getMyMoneys();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 63 + MediaQuery.of(context).viewPadding.bottom,
      ),
      child: ListView(
        children: [
          const SizedBox(height: 13),
          const PageTitle('Finance'),
          const SizedBox(height: 25),
          MoneyPieChart(
            profit: profit,
            loss: loss,
            total: total,
          ),
          const SizedBox(height: 42),
          const LineWidget(title: 'Loss'),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 10),
              BarChartCard(
                title: 'Mo',
                profitHeight: getHeight(w1Profit, w1Loss),
                lossHeight: getHeight(w1Loss, w1Profit),
              ),
              BarChartCard(
                title: 'Tu',
                profitHeight: getHeight(w2Profit, w2Loss),
                lossHeight: getHeight(w2Loss, w2Profit),
              ),
              BarChartCard(
                title: 'We',
                profitHeight: getHeight(w3Profit, w3Loss),
                lossHeight: getHeight(w3Loss, w3Profit),
              ),
              BarChartCard(
                title: 'Th',
                profitHeight: getHeight(w4Profit, w4Loss),
                lossHeight: getHeight(w4Loss, w4Profit),
              ),
              BarChartCard(
                title: 'Fr',
                profitHeight: getHeight(w5Profit, w5Loss),
                lossHeight: getHeight(w5Loss, w5Profit),
              ),
              BarChartCard(
                title: 'Sa',
                profitHeight: getHeight(w6Profit, w6Loss),
                lossHeight: getHeight(w6Loss, w6Profit),
              ),
              BarChartCard(
                title: 'Su',
                profitHeight: getHeight(w7Profit, w7Loss),
                lossHeight: getHeight(w7Loss, w7Profit),
              ),
              const Spacer(),
              Text(
                '$loss\$',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(width: 17),
            ],
          ),
          const SizedBox(height: 5),
          const LineWidget(title: 'Profit'),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              Text(
                '$profit\$',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(width: 17),
            ],
          ),
          const SizedBox(height: 5),
          const LineWidget(title: 'Total'),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '$total\$',
              style: const TextStyle(
                color: AppColors.main,
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
