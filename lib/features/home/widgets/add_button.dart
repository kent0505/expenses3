import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.profit,
  });

  final bool profit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: profit ? AppColors.main50 : AppColors.red50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoButton(
          onPressed: () {
            context.push('/addmoney', extra: profit);
          },
          padding: EdgeInsets.zero,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Add Money',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'SF',
                  ),
                ),
                Text(
                  profit ? 'Profit' : 'Loss',
                  style: TextStyle(
                    color: AppColors.black50,
                    fontSize: 10,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
