import 'package:flutter/material.dart';

import '../../../core/widgets/page_title.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 13),
        PageTitle('Finance'),
      ],
    );
  }
}
