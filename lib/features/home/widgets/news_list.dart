import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../models/newsmodel.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawScrollbar(
        padding: const EdgeInsets.only(right: 7),
        thumbColor: AppColors.main50,
        radius: const Radius.circular(12),
        thumbVisibility: true,
        thickness: 5,
        child: ListView(
          children: [
            ...List.generate(
              newsmodels.length,
              (index) {
                return _NewsCard(newsmodel: newsmodels[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.newsmodel});

  final Newsmodel newsmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/news1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  newsmodel.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PoppinsRegular',
                  ),
                ),
                Text(
                  newsmodel.desc,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PoppinsRegular',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Spacer(),
              Text(
                newsmodel.date,
                style: TextStyle(
                  color: AppColors.black50,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SFBold',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
