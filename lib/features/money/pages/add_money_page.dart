import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/money_bloc.dart';
import '../models/money.dart';
import '../widgets/amount_field.dart';
import '../widgets/category_widget.dart';
import '../widgets/currency_widget.dart';
import '../widgets/highlight_widget.dart';
import '../widgets/title_field.dart';
import '../widgets/title_text.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({
    super.key,
    required this.profit,
  });

  final bool profit;

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;
  bool highlight = false;

  void onAdd() {
    context.read<MoneyBloc>().add(
          AddMoneyEvent(
            money: Money(
              id: getCurrentTimestamp(),
              title: controller3.text,
              category: controller1.text,
              currency: controller2.text,
              amount: int.parse(controller4.text),
              profit: widget.profit,
              important: highlight,
            ),
          ),
        );
    context.pop();
  }

  void onCurrencyTap(String value) {
    setState(() {
      controller2.text = value;
    });
    checkActive();
  }

  void onHighlightTap(bool value) {
    setState(() {
      if (highlight) {
        if (value) return;
        highlight = false;
      } else {
        if (value) return;
        highlight = true;
      }
    });
    log(highlight.toString());
  }

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (controller3.text.isEmpty) {
        active = false;
      } else if (controller4.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TitleText(profit: widget.profit),
            const SizedBox(height: 100),
            CategoryWidget(controller: controller1),
            const SizedBox(height: 28),
            Row(
              children: [
                CurrencyWidget(
                  currency: '\$',
                  controller: controller2,
                  active: controller2.text == '\$',
                  onTap: onCurrencyTap,
                ),
                const SizedBox(width: 13),
                CurrencyWidget(
                  currency: '₺',
                  controller: controller2,
                  active: controller2.text == '₺',
                  onTap: onCurrencyTap,
                ),
                const SizedBox(width: 13),
                CurrencyWidget(
                  currency: '€',
                  controller: controller2,
                  active: controller2.text == '€',
                  onTap: onCurrencyTap,
                ),
              ],
            ),
            const SizedBox(height: 28),
            TitleField(
              controller: controller3,
              onChanged: checkActive,
            ),
            const SizedBox(height: 28),
            AmountField(
              controller: controller4,
              onChanged: checkActive,
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Text(
                  'Highlight as important:',
                  style: TextStyle(
                    color: AppColors.black50,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                HighlightWidget(
                  title: 'Yes',
                  active: highlight,
                  onTap: onHighlightTap,
                ),
                const SizedBox(width: 30),
                HighlightWidget(
                  title: 'No',
                  active: !highlight,
                  onTap: onHighlightTap,
                ),
              ],
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Add',
              active: active,
              onPressed: onAdd,
            ),
            SizedBox(height: 54 + MediaQuery.of(context).viewPadding.bottom),
          ],
        ),
      ),
    );
  }
}
