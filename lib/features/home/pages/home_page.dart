import 'package:expense_test/core/config/app_colors.dart';
import 'package:expense_test/features/home/widgets/add_button.dart';
import 'package:expense_test/features/home/widgets/money_card.dart';
import 'package:expense_test/features/money/bloc/money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../finance/pages/finance_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/balance_card.dart';
import '../widgets/hello_text.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeSettings) return const SettingsPage();

                if (state is HomeFinance) return const FinancePage();

                return const _Home();
              },
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  @override
  void initState() {
    super.initState();
    context.read<MoneyBloc>().add(GetMoneysEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 13),
        const HelloText(),
        const SizedBox(height: 20),
        const BalanceCard(),
        const SizedBox(height: 18),
        const Row(
          children: [
            SizedBox(width: 24),
            AddButton(profit: true),
            SizedBox(width: 14),
            AddButton(profit: false),
            SizedBox(width: 24),
          ],
        ),
        const SizedBox(height: 10),
        BlocBuilder<MoneyBloc, MoneyState>(
          builder: (context, state) {
            if (state is MoneysLoadedState) {
              return Expanded(
                child: RawScrollbar(
                  padding: const EdgeInsets.only(right: 7),
                  thumbColor: AppColors.main50,
                  radius: const Radius.circular(12),
                  thumbVisibility: true,
                  thickness: 5,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      ...List.generate(
                        state.moneys.length,
                        (index) {
                          return MoneyCard(money: state.moneys[index]);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return Container();
          },
        ),
        SizedBox(height: 63 + MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}
