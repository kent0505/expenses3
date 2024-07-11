import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

// class AchievesList extends StatelessWidget {
//   const AchievesList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MoneyBloc, MoneyState>(
//       builder: (context, state) {
//         return Expanded(
//           child: RawScrollbar(
//             padding: const EdgeInsets.only(right: 7),
//             thumbColor: AppColors.main50,
//             radius: const Radius.circular(12),
//             thumbVisibility: true,
//             thickness: 5,
//             child: ListView(
//               // padding: const EdgeInsets.symmetric(horizontal: 24),
//               children: [
//                 const SizedBox(height: 16),
//                 AchieveCard(
//                   title: 'Spend \$1,000 in a month',
//                   asset: 'achieve1',
//                   active: achieve1,
//                 ),
//                 AchieveCard(
//                   title: 'Spend \$5,000 in a month',
//                   asset: 'achieve2',
//                   active: achieve2,
//                 ),
//                 AchieveCard(
//                   title: 'Invest \$3,000 in education',
//                   asset: 'achieve3',
//                   active: achieve3,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class AchieveCard extends StatelessWidget {
  const AchieveCard({
    super.key,
    required this.title,
    required this.asset,
    required this.active,
  });

  final String title;
  final String asset;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 400,
      // color: Colors.redAccent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 77,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: active ? const Color(0xff66DB48) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.border,
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'PoppinsLight',
                  ),
                ),
              ),
            ),
          ),
          if (asset == 'achieve2') ...[
            Positioned(
              right: 0,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-20 / 360),
                child: Image.asset(
                  'assets/$asset.png',
                  height: 62,
                ),
              ),
            ),
          ] else
            Positioned(
              right: 0,
              child: Image.asset(
                'assets/$asset.png',
                height: 62,
              ),
            ),
        ],
      ),
    );
  }
}
