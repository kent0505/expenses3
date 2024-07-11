import 'dart:ui';

import 'package:expense_test/core/widgets/buttons/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../bloc/target_bloc.dart';

class TargetCard extends StatefulWidget {
  const TargetCard({super.key});

  @override
  State<TargetCard> createState() => _TargetCardState();
}

class _TargetCardState extends State<TargetCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TargetBloc, TargetState>(
      builder: (context, state) {
        if (state is TargetLoadedState) {
          if (state.targets.isEmpty) {
            return Center(
              child: PrimaryButton(
                title: 'Add new card',
                width: 120,
                onPressed: () {
                  context.push('/addtarget');
                },
              ),
            );
          }

          return Column(
            children: [
              if (expanded)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 40),
                        Text(
                          'Targets',
                          style: TextStyle(
                            color: AppColors.black50,
                            fontSize: 18,
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            setState(() {
                              expanded = false;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(
                              'assets/expand.svg',
                              height: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    ...List.generate(
                      state.targets.length,
                      (index) {
                        return Container(
                          height: 160,
                          width: 228,
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 35,
                          ),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black25,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: CupertinoButton(
                              onPressed: () {
                                context.push(
                                  '/edittarget',
                                  extra: state.targets[index],
                                );
                              },
                              padding: EdgeInsets.zero,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  state.targets[index].target,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'SF',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: PrimaryButton(
                        title: 'Add new card',
                        width: 120,
                        onPressed: () {
                          context.push('/addtarget');
                        },
                      ),
                    )
                  ],
                )
              else
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 24),
                        Text(
                          'Card',
                          style: TextStyle(
                            color: AppColors.black50,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 24),
                        Container(
                          height: 160,
                          width: 228,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black25,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 35,
                                ),
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 2,
                                    sigmaY: 2,
                                  ),
                                  child: Text(
                                    state.targets.isNotEmpty
                                        ? state.targets[0].target
                                        : '',
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'SF',
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expanded = true;
                                      });
                                    },
                                    padding: EdgeInsets.zero,
                                    child: SvgPicture.asset(
                                      'assets/expand.svg',
                                      height: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          children: [
                            Text(
                              'Targets',
                              style: TextStyle(
                                color: AppColors.black50,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 2),
                            RotationTransition(
                              turns: const AlwaysStoppedAnimation(113 / 360),
                              child: Image.asset(
                                'assets/dash.png',
                                height: 90,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
