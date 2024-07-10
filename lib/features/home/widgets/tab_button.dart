import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.title,
    required this.active,
    required this.onTap,
  });

  final String title;
  final bool active;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: active ? AppColors.main : AppColors.black50,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            if (active)
              BoxShadow(
                color: AppColors.black25,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: CupertinoButton(
          onPressed: () {
            onTap(title);
          },
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
