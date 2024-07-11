import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/go_back_button.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../money/widgets/delete_dialog.dart';
import '../bloc/target_bloc.dart';
import '../models/target.dart';
import '../widgets/target_field.dart';

class TargetEditPage extends StatefulWidget {
  const TargetEditPage({super.key, required this.target});

  final Target target;

  @override
  State<TargetEditPage> createState() => _TargetEditPageState();
}

class _TargetEditPageState extends State<TargetEditPage> {
  final controller = TextEditingController();

  bool active = true;

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
  void initState() {
    super.initState();
    controller.text = widget.target.target;
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
          Row(
            children: [
              const SizedBox(width: 25),
              const GoBackButton(),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Target',
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 24,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).viewPadding.top,
                ),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: CupertinoButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteDialog(
                          onYes: () {
                            context
                                .read<TargetBloc>()
                                .add(DeleteTargetEvent(id: widget.target.id));
                            context.pop();
                          },
                        );
                      },
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25),
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
              title: 'Edit',
              active: active,
              onPressed: () {
                context.read<TargetBloc>().add(
                      EditTargetEvent(
                        target: Target(
                          id: widget.target.id,
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
