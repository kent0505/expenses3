import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: AppColors.black50,
        fontSize: 16,
      ),
      decoration: InputDecoration(
          hintText: 'Add Input',
          hintStyle: TextStyle(
            color: AppColors.black50,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder()
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.transparent),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.transparent),
          // ),
          ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        onChanged();
      },
    );
  }
}
