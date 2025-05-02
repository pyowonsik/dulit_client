import 'package:dulit_client/features/anniversary/presentation/pages/anniversary_screen.dart';
import 'package:flutter/material.dart';

import 'package:dulit_client/features/calendar/presentation/pages/calendar_screen.dart';
import 'package:dulit_client/features/chat/presentation/pages/chat_screen.dart';
import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';
import 'package:dulit_client/features/post/presentation/pages/post_screen.dart';
import 'package:dulit_client/features/profile/presentation/pages/profile_screen.dart';

class RootTab extends StatefulWidget {
  // static String get routeName => 'home';
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this); // 탭 개수를 5개로 변경
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem(Icons.home_outlined, '홈', 0),
                _buildTabItem(Icons.chat_bubble_outline, '채팅', 1),
                _buildTabItem(Icons.calendar_today_outlined, '캘린더', 2),
                _buildTabItem(Icons.article_outlined, '게시글', 3),
                _buildTabItem(Icons.person_outlined, '유저', 4),
              ],
            ),
          ),
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          AnniversaryScreen(),
          ChatScreen(),
          CalendarScreen(),
          PostScreen(),
          ProfileScreen()
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label, int tabIndex) {
    final isSelected = index == tabIndex;

    return InkWell(
      onTap: () => controller.animateTo(tabIndex),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: isSelected ? 16 : 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow.shade50 : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.amber.shade200) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.amber.shade700 : Colors.grey.shade600,
              size: 24,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.amber.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
