import 'package:flutter/material.dart';

import 'package:dulit_client/calendar/view/calendar_screen.dart';
import 'package:dulit_client/chat/view/chat_screen.dart';
import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';
import 'package:dulit_client/home/view/home_screen.dart';
import 'package:dulit_client/post/view/post_screen.dart';
import 'package:dulit_client/profile/view/profile_screen.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: BODY_TEXT_COLOR,
        unselectedItemColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: '채팅'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: '캘린더'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: '게시글'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: '유저'),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeScreen(),
          ChatScreen(),
          CalendarScreen(),
          PostScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
