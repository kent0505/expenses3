import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class HighlightWidget extends StatelessWidget {
  const HighlightWidget({
    super.key,
    required this.title,
    required this.active,
    required this.onTap,
  });

  final String title;
  final bool active;
  final void Function(bool) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 30,
        width: 130,
        child: CupertinoButton(
          onPressed: () {
            onTap(active);
          },
          padding: EdgeInsets.zero,
          child: Container(
            height: 30,
            width: 130,
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: active ? AppColors.main : Colors.black,
                width: active ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black25,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'SF',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
