import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../config/app_colors.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(22),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.pop();
        },
        padding: EdgeInsets.zero,
        child: Center(
          child: SvgPicture.asset('assets/back.svg'),
        ),
      ),
    );
  }
}
