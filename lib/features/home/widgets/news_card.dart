import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../models/newsmodel.dart';

// class NewsList extends StatelessWidget {
//   const NewsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: RawScrollbar(
//         padding: const EdgeInsets.only(right: 7),
//         thumbColor: AppColors.main50,
//         radius: const Radius.circular(12),
//         thumbVisibility: true,
//         thickness: 5,
//         child: ListView(
//           children: [
//             ...List.generate(
//               newsmodels.length,
//               (index) {
//                 return NewsCard(newsmodel: newsmodels[index]);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsmodel});

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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: newsmodel.url,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    context.push('/news', extra: newsmodel);
                  },
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          newsmodel.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          newsmodel.desc,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
