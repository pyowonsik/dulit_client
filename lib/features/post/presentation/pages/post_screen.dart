import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';
import 'package:dulit_client/features/post/presentation/widgets/post_card.dart';
import 'package:dulit_client/features/post/presentation/viewmodels/post_provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postProvider); // 상태 구독

    return DefaultLayout(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.yellow.shade50, // 연노랑 그라데이션 시작
              Colors.white, // 흰색으로 그라데이션 끝
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // 귀여운 헤더와 하트 아이콘
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.amber, // 노랑 계열 하트 아이콘
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '전체 데이트 여행',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade700, // 진한 노랑 텍스트
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    // 귀여운 추가 버튼
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade100, // 연노랑 배경
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow.shade200
                                .withOpacity(0.3), // 연노랑 그림자
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.amber.shade700, // 진한 노랑 아이콘
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '글쓰기',
                                  style: TextStyle(
                                    color: Colors.amber.shade700, // 진한 노랑 텍스트
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 카테고리 칩
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryChip('전체', isSelected: true),
                      _buildCategoryChip('데이트 코스'),
                      _buildCategoryChip('맛집'),
                      _buildCategoryChip('여행'),
                      _buildCategoryChip('기념일'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 애니메이션 포스트 리스트
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: ListView.builder(
                    key: const ValueKey('posts-list'),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5, // 실제 포스트 수로 대체
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildEnhancedPostCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.yellow.shade100 : Colors.white, // 연노랑/흰색 배경
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.amber.shade300
                : Colors.grey.shade300, // 노랑/회색 테두리
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.yellow.shade100.withOpacity(0.5), // 연노랑 그림자
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Colors.amber.shade700
                      : Colors.grey.shade700, // 진한 노랑/회색 텍스트
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedPostCard() {
    // 실제 PostCard의 향상된 스타일링을 위한 플레이스홀더
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 사용자 정보가 있는 포스트 헤더
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade100, // 연노랑 배경
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.amber.shade200, // 노랑 테두리
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '💑',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '행복한커플',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '2시간 전',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),

          // 포스트 이미지
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            child: Image.network(
              'https://picsum.photos/seed/picsum/400/250',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // 포스트 내용
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '남산타워 데이트 코스 추천해요! 💕',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '오늘 남산타워에 다녀왔는데 너무 좋았어요! 야경이 정말 예쁘고 분위기도 너무 로맨틱했어요. 다들 한번 가보세요~',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),

                // 태그
                Wrap(
                  spacing: 8,
                  children: [
                    _buildTag('남산타워'),
                    _buildTag('데이트코스'),
                    _buildTag('야경'),
                  ],
                ),

                const SizedBox(height: 16),

                // 상호작용 버튼
                Row(
                  children: [
                    _buildInteractionButton(
                      Icons.favorite_border,
                      '128',
                      Colors.amber.shade400, // 노랑 계열 좋아요 버튼
                    ),
                    const SizedBox(width: 16),
                    _buildInteractionButton(
                      Icons.chat_bubble_outline,
                      '24',
                      Colors.amber.shade700, // 진한 노랑 댓글 버튼
                    ),
                    const SizedBox(width: 16),
                    _buildInteractionButton(
                      Icons.bookmark_border,
                      '저장',
                      Colors.amber.shade800, // 더 진한 노랑 저장 버튼
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50, // 연노랑 배경
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '#$label',
        style: TextStyle(
          color: Colors.amber.shade700, // 진한 노랑 텍스트
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildInteractionButton(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
