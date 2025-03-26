import 'package:flutter/material.dart';

import 'package:dulit_client/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const DefaultLayout(
      {super.key,
      this.title,
      this.backgroundColor,
      required this.child,
      this.bottomNavigationBar,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? PRIMARY_COLOR,
      appBar: renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
