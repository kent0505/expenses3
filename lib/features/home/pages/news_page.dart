import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/go_back_button.dart';
import '../models/newsmodel.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key, required this.newsmodel});

  final Newsmodel newsmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            children: [
              SizedBox(width: 27),
              GoBackButton(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 27),
                child: Text(
                  'News',
                  style: TextStyle(
                    color: AppColors.main,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              SizedBox(width: 44 + 27),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                // const SizedBox(height: 52),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: newsmodel.url,
                            fit: BoxFit.fitWidth,
                          ),
                          Center(
                            child: Text(
                              newsmodel.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'PoppinsRegular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
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
                    const SizedBox(width: 27),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 34,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    newsmodel.desc,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15 + MediaQuery.of(context).viewPadding.bottom,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
