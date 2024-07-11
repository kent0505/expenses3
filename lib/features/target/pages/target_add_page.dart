import 'package:expense_test/features/target/widgets/target_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/go_back_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/target_bloc.dart';
import '../models/target.dart';

class TargetAddPage extends StatefulWidget {
  const TargetAddPage({super.key});

  @override
  State<TargetAddPage> createState() => _TargetAddPageState();
}

class _TargetAddPageState extends State<TargetAddPage> {
  final controller = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      if (controller.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            children: [
              SizedBox(width: 25),
              GoBackButton(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Target',
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 24,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(width: 25 + 44),
            ],
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TargetField(
              controller: controller,
              onChanged: checkActive,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: PrimaryButton(
              title: 'Add',
              active: active,
              onPressed: () {
                context.read<TargetBloc>().add(
                      AddTargetEvent(
                        target: Target(
                          id: getCurrentTimestamp(),
                          target: controller.text,
                        ),
                      ),
                    );
                context.pop();
              },
            ),
          ),
          SizedBox(height: 54 + MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}
