import 'package:flutter/material.dart';

import 'package:dulit_client/common/const/colors.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Text('안녕하세요!'),
          ),
        ),
        const SizedBox(height: 8), // 받은 메시지 (왼쪽)
      ],
    );
  }
}
