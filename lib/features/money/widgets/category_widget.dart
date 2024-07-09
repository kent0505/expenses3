import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/app_colors.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  bool expanded = false;

  void onTap(String category) {
    setState(() {
      widget.controller.text = category;
      expanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: CupertinoButton(
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                const SizedBox(height: 7),
                Row(
                  children: [
                    SvgPicture.asset('assets/wallet.svg'),
                    const Spacer(),
                    Text(
                      widget.controller.text.isEmpty
                          ? 'Choose a category'
                          : widget.controller.text,
                      style: TextStyle(
                        color: AppColors.black50,
                        fontSize: 16,
                        fontFamily: 'SF',
                      ),
                    ),
                    const Spacer(),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      turns: expanded ? 1 / 2 : 1,
                      child: SvgPicture.asset('assets/expand.svg'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (expanded) ...[
          _CategoryTile(
            title: 'Gifts',
            onTap: onTap,
          ),
          _CategoryTile(
            title: 'Sallary',
            onTap: onTap,
          ),
          _CategoryTile(
            title: 'Passive',
            onTap: onTap,
          ),
          _CategoryTile(
            title: 'Freelance',
            onTap: onTap,
          ),
          _CategoryTile(
            title: 'Other',
            onTap: onTap,
          ),
        ],
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: CupertinoButton(
        onPressed: () {
          onTap(title);
        },
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'SF',
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
