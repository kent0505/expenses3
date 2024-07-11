import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/page_title.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 13),
          const PageTitle('Settings'),
          const SizedBox(height: 34),
          Image.asset('assets/user.png', height: 154),
          CupertinoButton(
            onPressed: () {
              context.go('/name');
            },
            padding: EdgeInsets.zero,
            child: Text(
              myname.isNotEmpty ? myname : 'Steve',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'SF',
              ),
            ),
          ),
          const SizedBox(height: 84),
          const _Button('Terms of use'),
          const SizedBox(height: 16),
          const _Button('Privacy policy'),
          const SizedBox(height: 16),
          const _Button('Support page'),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffC9C9C9),
        ),
      ),
      child: CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'PoppinsRegular',
            ),
          ),
        ),
      ),
    );
  }
}
