import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../finance/pages/finance_page.dart';
import '../../money/bloc/money_bloc.dart';
import '../widgets/achieves_list.dart';
import '../widgets/money_list.dart';
import '../bloc/home_bloc.dart';
import '../widgets/add_button.dart';
import '../widgets/balance_card.dart';
import '../widgets/hello_text.dart';
import '../widgets/nav_bar.dart';
import '../widgets/news_list.dart';
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
        if (tabIndex == 0) const MoneyList(),
        if (tabIndex == 1) const NewsList(),
        if (tabIndex == 2) const AchievesList(),
        SizedBox(height: 63 + MediaQuery.of(context).viewPadding.bottom),
      ],
    );
  }
}
