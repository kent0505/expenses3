import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../finance/pages/finance_page.dart';
import '../../money/bloc/money_bloc.dart';
import '../../target/bloc/target_bloc.dart';
import '../../target/widgets/target_card.dart';
import '../models/newsmodel.dart';
import '../widgets/achieves_card.dart';
import '../widgets/money_card.dart';
import '../bloc/home_bloc.dart';
import '../widgets/add_button.dart';
import '../widgets/balance_card.dart';
import '../widgets/hello_text.dart';
import '../widgets/nav_bar.dart';
import '../widgets/news_card.dart';
import '../widgets/tab_button.dart';
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
  final scrollCtrl = ScrollController();
  int tabIndex = 0;

  void onTabPressed(String title) {
    setState(() {
      if (title == 'History') tabIndex = 0;
      if (title == 'News') tabIndex = 1;
      if (title == 'Achieves') tabIndex = 2;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<MoneyBloc>().add(GetMoneysEvent());
    context.read<TargetBloc>().add(GetTargetsEvent());
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
        const SizedBox(height: 8),
        BlocBuilder<MoneyBloc, MoneyState>(
          builder: (context, state) {
            return Expanded(
              child: RawScrollbar(
                padding: const EdgeInsets.only(right: 7),
                thumbColor: AppColors.main50,
                radius: const Radius.circular(12),
                controller: scrollCtrl,
                thickness: 5,
                child: ListView(
                  controller: scrollCtrl,
                  children: [
                    const SizedBox(height: 8),
                    const TargetCard(),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 24),
                        TabButton(
                          title: 'History',
                          active: tabIndex == 0,
                          onTap: onTabPressed,
                        ),
                        const SizedBox(width: 24),
                        TabButton(
                          title: 'News',
                          active: tabIndex == 1,
                          onTap: onTabPressed,
                        ),
                        const SizedBox(width: 24),
                        TabButton(
                          title: 'Achieves',
                          active: tabIndex == 2,
                          onTap: onTabPressed,
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (tabIndex == 0) ...[
                      if (state is MoneysLoadedState) ...[
                        ...List.generate(
                          state.moneys.length,
                          (index) {
                            return MoneyCard(money: state.moneys[index]);
                          },
                        ),
                      ]
                    ],
                    if (tabIndex == 1) ...[
                      ...List.generate(
                        newsmodels.length,
                        (index) {
                          return NewsCard(newsmodel: newsmodels[index]);
                        },
                      ),
                    ],
                    if (tabIndex == 2) ...[
                      const SizedBox(height: 16),
                      AchieveCard(
                        title: 'Spend \$1,000 in a month',
                        asset: 'achieve1',
                        active: achieve1,
                      ),
                      AchieveCard(
                        title: 'Spend \$5,000 in a month',
                        asset: 'achieve2',
                        active: achieve2,
                      ),
                      AchieveCard(
                        title: 'Invest \$3,000 in education',
                        asset: 'achieve3',
                        active: achieve3,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 63 + MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}
