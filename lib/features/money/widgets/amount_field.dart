import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/config/app_colors.dart';

class AmountField extends StatelessWidget {
  const AmountField({
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
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(6),
        // LengthLimitingTextInputFormatter(limit),
      ],
      style: TextStyle(
        color: AppColors.black50,
        fontSize: 16,
      ),
      decoration: InputDecoration(
          hintText: 'Amount of money',
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
