import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final controller = TextEditingController();

  bool active = false;

  void onChanged() {
    setState(() {
      if (controller.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  void onNext() async {
    await saveUser(controller.text).then((value) {
      context.go('/greetings');
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
          SizedBox(height: 30 + MediaQuery.of(context).viewPadding.top),
          const Center(
            child: Text(
              'Let\'s get to know each other!',
              style: TextStyle(
                color: AppColors.main,
                fontSize: 22,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(width: 25),
              Text(
                'Enter a name',
                style: TextStyle(
                  color: AppColors.black25,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: _NameField(
              controller: controller,
              onChanged: onChanged,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: PrimaryButton(
              title: 'Next',
              active: active,
              onPressed: onNext,
            ),
          ),
          SizedBox(height: 54 + MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
        decoration: const InputDecoration(
          // hintText: 'Name',
          // hintStyle: TextStyle(
          //   color: AppColors.white50,
          //   fontSize: 16,
          //   fontWeight: FontWeight.w500,
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          onChanged();
        },
      ),
    );
  }
}
