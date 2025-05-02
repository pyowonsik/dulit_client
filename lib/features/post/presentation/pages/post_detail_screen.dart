import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final String postId;

  const PostDetailScreen({
    required this.postId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '강서구 데이트 코스',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user1',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '2025.03.7',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF737373)),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 1,
                  color: Color(0xFF737373),
                ),
              ),
              Text(
                '안녕하세요! 강서구 데이트 코스 소개드릴게요~ 저희 커플은 까치산역 근처 거주하고 있어서 발산부터 신정네,목동까지 되게 자주 돌아다니는데 오늘은 먹거리 위주로!! 맛집 데이트 코스 알려드릴게요',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  'asset/img/dateImage.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover, // 이미지를 박스 크기에 맞게 조정
                  colorBlendMode: BlendMode.darken, // 이미지 색상 조정 (선택 사항)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
