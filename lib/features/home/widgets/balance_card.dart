import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../money/bloc/money_bloc.dart';

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
              BlocBuilder<MoneyBloc, MoneyState>(
                builder: (context, state) {
                  return Text(
                    '${getBalance()}',
                    style: const TextStyle(
                      color: AppColors.main,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
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
          BlocBuilder<MoneyBloc, MoneyState>(
            builder: (context, state) {
              if (state is MoneysLoadedState) {
                return Expanded(
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/linedash.png',
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          const SizedBox(height: 15),
                          Image.asset(
                            'assets/linedash.png',
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          const SizedBox(height: 15),
                          Image.asset(
                            'assets/linedash.png',
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _BarChart(
                            h1: getHeight(m1Profit, m1Loss),
                            h2: getHeight(m1Loss, m1Profit),
                            month: 'Jan',
                            current: chechMonth(1),
                          ),
                          _BarChart(
                            h1: getHeight(m2Profit, m2Loss),
                            h2: getHeight(m2Loss, m2Profit),
                            month: 'Feb',
                            current: chechMonth(2),
                          ),
                          _BarChart(
                            h1: getHeight(m3Profit, m3Loss),
                            h2: getHeight(m3Loss, m3Profit),
                            month: 'Mar',
                            current: chechMonth(3),
                          ),
                          _BarChart(
                            h1: getHeight(m4Profit, m4Loss),
                            h2: getHeight(m4Loss, m4Profit),
                            month: 'Apr',
                            current: chechMonth(4),
                          ),
                          _BarChart(
                            h1: getHeight(m5Profit, m5Loss),
                            h2: getHeight(m5Loss, m5Profit),
                            month: 'May',
                            current: chechMonth(5),
                          ),
                          _BarChart(
                            h1: getHeight(m6Profit, m6Loss),
                            h2: getHeight(m6Loss, m6Profit),
                            month: 'Jun',
                            current: chechMonth(6),
                          ),
                          _BarChart(
                            h1: getHeight(m7Profit, m7Loss),
                            h2: getHeight(m7Loss, m7Profit),
                            month: 'Jul',
                            current: chechMonth(7),
                          ),
                          _BarChart(
                            h1: getHeight(m8Profit, m8Loss),
                            h2: getHeight(m8Loss, m8Profit),
                            month: 'Aug',
                            current: chechMonth(8),
                          ),
                          _BarChart(
                            h1: getHeight(m9Profit, m9Loss),
                            h2: getHeight(m9Loss, m9Profit),
                            month: 'Sep',
                            current: chechMonth(9),
                          ),
                          _BarChart(
                            h1: getHeight(m10Profit, m10Loss),
                            h2: getHeight(m10Loss, m10Profit),
                            month: 'Oct',
                            current: chechMonth(10),
                          ),
                          _BarChart(
                            h1: getHeight(m11Profit, m11Loss),
                            h2: getHeight(m11Loss, m11Profit),
                            month: 'Nov',
                            current: chechMonth(11),
                          ),
                          _BarChart(
                            h1: getHeight(m12Profit, m12Loss),
                            h2: getHeight(m12Loss, m12Profit),
                            month: 'Dec',
                            current: chechMonth(12),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart({
    required this.h1,
    required this.h2,
    required this.month,
    required this.current,
  });

  final double h1;
  final double h2;
  final String month;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          month,
          style: TextStyle(
            color: current ? AppColors.main : const Color(0xffCACACA),
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: h1,
          width: 5,
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 2),
        Container(
          height: h2,
          width: 5,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
