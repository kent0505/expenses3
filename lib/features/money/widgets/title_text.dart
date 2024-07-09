import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/go_back_button.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.profit, this.onDelete});

  final bool profit;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const GoBackButton(),
        const Spacer(),
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Text(
              onDelete != null ? 'Edit Money' : 'Add Money',
              style: TextStyle(
                color: profit ? AppColors.main : AppColors.red,
                fontSize: 26,
              ),
            ),
            Text(
              profit ? 'Profit' : 'Loss',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const Spacer(),
        onDelete != null
            ? Container(
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
                  onPressed: onDelete,
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox(width: 44),
      ],
    );
  }
}
