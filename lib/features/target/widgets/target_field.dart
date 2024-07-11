import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class TargetField extends StatelessWidget {
  const TargetField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
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
