import 'package:expense_test/core/config/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key, required this.onYes});

  final void Function() onYes;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width > 300 ? 300 : null,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Delete?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 20),
                _Button(
                  title: 'NO',
                  onPressed: () {
                    context.pop();
                  },
                ),
                const Spacer(),
                _Button(
                  title: 'YES',
                  onPressed: () {
                    context.pop();
                    onYes();
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        height: 30,
        width: 60,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.main,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
