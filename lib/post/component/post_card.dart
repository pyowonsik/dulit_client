import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:dulit_client/common/const/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/post/1');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16), // rounded-2xl에 해당
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 14,
                                color: BODY_TEXT_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('강서구 데이트 코스',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const Text(
                      '안녕하세요! 강서구 데이트 코스 소개드릴게요~ 저희 커플은 까치산역 근처 거주하고 있어서 발산부터 신정네,목동까지 되게 자주 돌아다니는데 오늘은 먹거리 위주로!! 맛집 데이트 코스 알려드릴게요',
                      style: TextStyle(fontSize: 14),
                    )
                  ]),
            ),
            const SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // 바깥쪽 모서리를 둥글게 처리(
              child: Image.asset(
                'asset/img/dateImage.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover, // 이미지를 박스 크기에 맞게 조정
                colorBlendMode: BlendMode.darken, // 이미지 색상 조정 (선택 사항)
              ),
            )
          ],
        ),
      ),
    );
  }
}
