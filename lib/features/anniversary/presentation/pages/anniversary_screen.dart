import 'package:flutter/material.dart';
import 'package:dulit_client/common/layout/default_layout.dart';

class AnniversaryScreen extends StatefulWidget {
  const AnniversaryScreen({super.key});

  @override
  State<AnniversaryScreen> createState() => _AnniversaryScreenState();
}

class _AnniversaryScreenState extends State<AnniversaryScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  // 샘플 D-Day 데이터
  final List<DdayItem> _ddayItems = [
    DdayItem(
      title: '우리 만난지',
      days: '924일',
      date: '2022.08.04',
      emoji: '❤️',
    ),
    DdayItem(
      title: '여행',
      days: '13일',
      date: '2025.04.02',
      emoji: '❤️',
    ),
    DdayItem(
      title: '여행',
      days: '13일',
      date: '2025.04.02',
      emoji: '❤️',
    ),
  ];

  // 샘플 데이트 계획 데이터
  final List<DatePlanItem> _datePlans = [
    DatePlanItem(
      emoji: '🎬',
      title: '영화 보기',
      date: '2025년 2월 14일 (수)',
    ),
    DatePlanItem(
      emoji: '🍚',
      title: '떡도리탕 먹으러 가기',
      date: '2025년 2월 15일 (목)',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // D-DAY 섹션
              _buildSectionCard(
                title: 'D-DAY',
                onAddPressed: () {
                  // D-Day 추가 로직
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 220,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _ddayItems.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return _buildDdayCard(_ddayItems[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 페이지 컨트롤 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _currentPage > 0
                              ? () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                          child: const Text('Prev'),
                        ),
                        ElevatedButton(
                          onPressed: _currentPage < _ddayItems.length - 1
                              ? () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // When Date? 섹션
              _buildSectionCard(
                title: 'When Date ?',
                onAddPressed: () {
                  // 데이트 계획 추가 로직
                },
                child: Column(
                  children: _datePlans
                      .map((plan) => _buildDatePlanItem(plan))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 섹션 카드 위젯
  Widget _buildSectionCard({
    required String title,
    required Widget child,
    required VoidCallback onAddPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.shade100.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 섹션 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade700,
                ),
              ),
              IconButton(
                onPressed: onAddPressed,
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.amber.shade700,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 섹션 내용
          child,
        ],
      ),
    );
  }

  // D-Day 카드 위젯
  Widget _buildDdayCard(DdayItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          // 왼쪽 타이틀
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade400,
              ),
            ),
          ),

          // 중앙 이모지
          Center(
            child: Text(
              item.emoji,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),

          // 오른쪽 날짜 정보
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.days,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.amber.shade200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 데이트 계획 아이템 위젯
  Widget _buildDatePlanItem(DatePlanItem plan) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 왼쪽 이모지와 제목
          Row(
            children: [
              Text(
                plan.emoji,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                plan.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),

          // 오른쪽 날짜
          Text(
            plan.date,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

// D-Day 아이템 모델
class DdayItem {
  final String title;
  final String days;
  final String date;
  final String emoji;

  DdayItem({
    required this.title,
    required this.days,
    required this.date,
    required this.emoji,
  });
}

// 데이트 계획 아이템 모델
class DatePlanItem {
  final String emoji;
  final String title;
  final String date;

  DatePlanItem({
    required this.emoji,
    required this.title,
    required this.date,
  });
}
