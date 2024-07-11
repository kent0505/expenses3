import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../money/models/money.dart';

// class MoneyList extends StatelessWidget {
//   const MoneyList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MoneyBloc, MoneyState>(
//       builder: (context, state) {
//         if (state is MoneysLoadedState) {
//           return Expanded(
//             child: RawScrollbar(
//               padding: const EdgeInsets.only(right: 7),
//               thumbColor: AppColors.main50,
//               radius: const Radius.circular(12),
//               thumbVisibility: true,
//               thickness: 5,
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 children: [
//                   ...List.generate(
//                     state.moneys.length,
//                     (index) {
//                       return _MoneyCard(money: state.moneys[index]);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         return Container();
//       },
//     );
//   }
// }

class MoneyCard extends StatelessWidget {
  const MoneyCard({super.key, required this.money});

  final Money money;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: CupertinoButton(
        onPressed: () {
          context.push('/editmoney', extra: money);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 24),
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: const Color(0xffF5F9FF),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Center(
                child: SvgPicture.asset('assets/wallet.svg'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Center(
                child: Text(
                  money.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'PoppinsLight',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 86,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${money.amount}${money.currency}',
                    style: TextStyle(
                      color: money.profit ? AppColors.main : AppColors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'PoppinsLight',
                    ),
                  ),
                  Text(
                    money.category,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'PoppinsLight',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
