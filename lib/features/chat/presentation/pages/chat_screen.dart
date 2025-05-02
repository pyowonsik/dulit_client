import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/common/layout/default_layout.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // 샘플 메시지 데이터
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "안녕하세요! 오늘 뭐하고 있어요?",
      isMe: false,
      time: "오전 10:30",
    ),
    ChatMessage(
      text: "안녕! 나 지금 카페에서 공부하고 있어 ☕",
      isMe: true,
      time: "오전 10:32",
    ),
    ChatMessage(
      text: "오 어떤 카페에요? 분위기 좋아요?",
      isMe: false,
      time: "오전 10:33",
    ),
    ChatMessage(
      text: "응! 여기 신촌에 새로 생긴 카페인데 조용하고 자리도 넓어서 좋아~",
      isMe: true,
      time: "오전 10:35",
    ),
    ChatMessage(
      text: "다음에 같이 가요! 나도 요즘 공부할 곳 찾고 있었는데 👀",
      isMe: false,
      time: "오전 10:36",
    ),
    ChatMessage(
      text: "좋아! 주말에 같이 갈래? 아메리카노가 진짜 맛있어!",
      isMe: true,
      time: "오전 10:38",
    ),
    ChatMessage(
      text: "당연하지! 토요일 어때요? 오후에 시간 돼요?",
      isMe: false,
      time: "오전 10:40",
    ),
  ];

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
        child: Column(
          children: [
            // 채팅방 헤더
            _buildChatHeader(context),

            // 날짜 구분선
            _buildDateDivider("오늘"),

            // 메시지 목록
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessageItem(message);
                },
              ),
            ),

            // 메시지 입력 영역
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // 채팅방 헤더
  Widget _buildChatHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 뒤로가기 버튼
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.amber.shade700,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 상대방 프로필 이미지
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.yellow.shade100,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.amber.shade200,
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

          // 채팅방 제목과 상태
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사랑하는 우리 💕',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '온라인',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 메뉴 버튼
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.amber.shade700,
            ),
          ),
        ],
      ),
    );
  }

  // 날짜 구분선
  Widget _buildDateDivider(String date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.amber.shade100,
                ),
              ),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.amber.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 메시지 아이템
  Widget _buildMessageItem(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 상대방 프로필 이미지 (내 메시지가 아닐 때만)
          if (!message.isMe) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.amber.shade200,
                  width: 1.5,
                ),
              ),
              child: const Center(
                child: Text(
                  '💑',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          // 메시지 시간 (내 메시지일 때는 오른쪽에)
          if (message.isMe) ...[
            Text(
              message.time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(width: 4),
          ],

          // 메시지 버블
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.65,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: message.isMe ? Colors.amber.shade100 : Colors.white,
              borderRadius: BorderRadius.circular(18).copyWith(
                bottomLeft: message.isMe
                    ? const Radius.circular(18)
                    : const Radius.circular(0),
                bottomRight: message.isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(18),
              ),
              border: message.isMe
                  ? null
                  : Border.all(
                      color: Colors.grey.shade200,
                    ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              message.text,
              style: TextStyle(
                fontSize: 14,
                color:
                    message.isMe ? Colors.amber.shade900 : Colors.grey.shade800,
              ),
            ),
          ),

          // 메시지 시간 (상대방 메시지일 때는 왼쪽에)
          if (!message.isMe) ...[
            const SizedBox(width: 4),
            Text(
              message.time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // 메시지 입력 영역
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 첨부 파일 버튼
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade50,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.amber.shade700,
                size: 24,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // 메시지 입력 필드
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.amber.shade100,
                ),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: '메시지를 입력하세요...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
                maxLines: null,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // 이모티콘 버튼
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow.shade50,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.amber.shade700,
                size: 24,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // 전송 버튼
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber.shade400,
                  Colors.amber.shade300,
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.shade200.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                // 메시지 전송 로직
                if (_messageController.text.trim().isNotEmpty) {
                  setState(() {
                    _messages.add(
                      ChatMessage(
                        text: _messageController.text.trim(),
                        isMe: true,
                        time: "지금",
                      ),
                    );
                    _messageController.clear();
                  });

                  // 스크롤을 맨 아래로 이동
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                }
              },
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 40,
                minHeight: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

// 채팅 메시지 모델
class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
  });
}
