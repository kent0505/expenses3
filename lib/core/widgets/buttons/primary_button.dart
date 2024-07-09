import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    this.width,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final double? width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? (MediaQuery.of(context).size.width > 400 ? 400 : null),
      decoration: BoxDecoration(
        color:
            active ? AppColors.main : const Color(0xff0077B9).withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CupertinoButton(
        onPressed: active ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active
                  ? Colors.white
                  : const Color(0xffFFFFFF).withOpacity(0.2),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
