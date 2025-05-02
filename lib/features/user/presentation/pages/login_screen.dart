import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                Text(
                  '둘잇',
                  style: TextStyle(
                      fontSize: 96,
                      color: BODY_TEXT_COLOR,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '두 사람을 이어주는 특별한 공간',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff4f709c80),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/home');
                    },
                    child: Image.asset(
                      'asset/img/카카오_로그인.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Row(
                        children: [
                          // 왼쪽 선
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          // 텍스트
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('또는'),
                          ),
                          // 오른쪽 선
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'asset/img/네이버_로그인_원형.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          'asset/img/애플_로그인_원형.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
