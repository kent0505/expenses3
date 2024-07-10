import 'package:flutter/material.dart';

import '../../../core/widgets/page_title.dart';
import '../widgets/money_pie_chart.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 13),
        PageTitle('Finance'),
        SizedBox(height: 25),
        MoneyPieChart(),
        SizedBox(height: 42),
      ],
    );
  }
}
