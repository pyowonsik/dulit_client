import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final List<Widget>? actions;
  final bool useGradientBackground;

  const DefaultLayout({
    super.key,
    this.title,
    this.backgroundColor,
    required this.child,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.actions,
    this.useGradientBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        appBar: renderAppBar(),
        body: useGradientBackground
            ? Container(
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
                child: child,
              )
            : child,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.amber.shade700,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.amber.shade700,
        ),
        actions: actions,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
        ),
      );
    }
  }
}
