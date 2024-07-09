import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();

  int pageIndex = 0;

  void onPressed() async {
    if (pageIndex == 2) {
      context.go('/name');
    } else {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        pageIndex = controller.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              children: const [
                // page 1
                Column(
                  children: [
                    _Image(
                      asset: 'o1',
                      title: 'Keep track of your spending\nand income!',
                      subtitle:
                          'Analyze your spending, record\nyour income, simplify your life, and\nbecome successful',
                    ),
                  ],
                ),

                // page 2
                Column(
                  children: [
                    _Image(
                      asset: 'o2',
                      title: 'Save your finances!',
                      subtitle:
                          'Analyze your approaches to\nfinances, stay ahead of the curve,\nkeep an eye on your spending\nschedule ',
                    ),
                  ],
                ),

                // page 3
                Column(
                  children: [
                    _Image(
                      asset: 'o3',
                      title: 'Answer questions, read\nthe news',
                      subtitle:
                          'Go through the quiz, improve your\nskills, gain new knowledge, read\ninteresting and exciting news\nstories',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 40),
              _PageIndicator(active: pageIndex == 0),
              const SizedBox(width: 7),
              _PageIndicator(active: pageIndex == 1),
              const SizedBox(width: 7),
              _PageIndicator(active: pageIndex == 2),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                width: 100,
                onPressed: onPressed,
              ),
              const SizedBox(width: 40),
            ],
          ),
          SizedBox(height: 30 + MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.asset,
    required this.title,
    required this.subtitle,
  });

  final String asset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            'assets/$asset.png',
            height: 400,
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Stack(
              children: [
                Image.asset(
                  'assets/circle.png',
                  height: 300,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xff565656).withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11,
      width: 45,
      decoration: BoxDecoration(
        color: active ? AppColors.main : AppColors.black50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (active)
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
        ],
      ),
    );
  }
}
