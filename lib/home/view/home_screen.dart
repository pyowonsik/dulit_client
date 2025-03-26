import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';
import 'package:dulit_client/home/component/anniversary_card.dart';
import 'package:dulit_client/home/component/create_anniversary_dialog.dart';
import 'package:dulit_client/home/model/anniversary_model.dart';
import 'package:dulit_client/home/provider/anniversary_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(anniversaryProvider); // 상태 구독
    DateTime selectedDate = DateTime.now();

    return DefaultLayout(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'D-DAY',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: BODY_TEXT_COLOR,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const CreateAnniversaryDialog());
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: BODY_TEXT_COLOR,
                                )),
                          ],
                        ),
                        Column(
                          children: state.anniversaries
                              .map((dday) => Column(
                                    children: [
                                      AnniversaryCard(
                                        anniversaryModel: dday,
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ))
                              .toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: BODY_TEXT_COLOR, // 배경 색상
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                disabledForegroundColor: PRIMARY_COLOR
                                    .withOpacity(0.5)
                                    .withOpacity(0.38),
                                disabledBackgroundColor: PRIMARY_COLOR
                                    .withOpacity(0.5)
                                    .withOpacity(0.12), // padding
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(30), // 둥근 모서리
                                ), // disabled 상태 색상
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // 텍스트 색상
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: BODY_TEXT_COLOR, // 배경 색상
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                disabledForegroundColor: PRIMARY_COLOR
                                    .withOpacity(0.5)
                                    .withOpacity(0.38),
                                disabledBackgroundColor: PRIMARY_COLOR
                                    .withOpacity(0.5)
                                    .withOpacity(0.12), // padding
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(30), // 둥근 모서리
                                ), // disabled 상태 색상
                              ),
                              child: const Text(
                                'Prev',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // 텍스트 색상
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
