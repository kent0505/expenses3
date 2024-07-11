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
                        children: const [
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Jan',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Feb',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Mar',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Apr',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'May',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Jun',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Jul',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Aug',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Sep',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Oct',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Nov',
                          ),
                          _BarChart(
                            h1: 80,
                            h2: 80,
                            month: 'Dec',
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
  });

  final double h1;
  final double h2;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          month,
          style: const TextStyle(
            color: Color(0xffCACACA),
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
