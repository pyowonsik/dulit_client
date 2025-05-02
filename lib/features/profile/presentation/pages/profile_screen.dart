import 'package:flutter/material.dart';
import 'package:dulit_client/common/layout/default_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 배경 장식이 있는 프로필 헤더
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // 장식용 상단 웨이브
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade200, // 노랑 배경
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // 장식 요소들
                        Positioned(
                          right: 40,
                          top: 20,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 20,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 프로필 아바타
                  Positioned(
                    top: 70,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.shade100
                                .withOpacity(0.5), // 노랑 그림자
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey,
                            // backgroundImage: AssetImage('asset/img/profileImage.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade400, // 노랑 편집 버튼
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 70),

              // 사용자 정보
              Text(
                '사용자 이름',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade700, // 진한 노랑 텍스트
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'user@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 프로필 통계
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 16),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem('게시글', '24'),
                    _buildDivider(),
                    _buildStatItem('팔로워', '128'),
                    _buildDivider(),
                    _buildStatItem('팔로잉', '56'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 프로필 액션
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        '프로필 편집',
                        Icons.edit_note,
                        Colors.amber.shade400, // 노랑 버튼
                        onTap: () {
                          // 프로필 편집 화면으로 이동하는 로직
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        '커플 연결',
                        Icons.favorite,
                        Colors.amber.shade600, // 진한 노랑 버튼
                        onTap: () {
                          // 커플 연결 로직
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 뱃지 섹션
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: Colors.amber.shade700, // 진한 노랑 아이콘
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '나의 뱃지',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildBadge('💑', '러브버드'),
                        _buildBadge('🌟', '인기쟁이'),
                        _buildBadge('📸', '포토그래퍼'),
                        _buildBadge('🎁', '선물왕'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 메뉴 아이템
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
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
                  children: [
                    _buildMenuItem(
                      '설정',
                      Icons.settings,
                      Colors.amber.shade400, // 노랑 아이콘
                      onTap: () {
                        // 설정 화면으로 이동하는 로직
                      },
                    ),
                    Divider(color: Colors.grey.shade100, height: 1),
                    _buildMenuItem(
                      '알림 설정',
                      Icons.notifications,
                      Colors.amber.shade500, // 노랑 아이콘
                      onTap: () {
                        // 알림 설정 화면으로 이동하는 로직
                      },
                    ),
                    Divider(color: Colors.grey.shade100, height: 1),
                    _buildMenuItem(
                      '개인정보 보호',
                      Icons.lock_outline,
                      Colors.amber.shade600, // 진한 노랑 아이콘
                      onTap: () {
                        // 개인정보 보호 화면으로 이동하는 로직
                      },
                    ),
                    Divider(color: Colors.grey.shade100, height: 1),
                    _buildMenuItem(
                      '고객 지원',
                      Icons.support_agent,
                      Colors.amber.shade700, // 더 진한 노랑 아이콘
                      onTap: () {
                        // 고객 지원 화면으로 이동하는 로직
                      },
                    ),
                    Divider(color: Colors.grey.shade100, height: 1),
                    _buildMenuItem(
                      '로그아웃',
                      Icons.logout,
                      Colors.red.shade400, // 로그아웃은 빨간색 유지
                      onTap: () {
                        // 로그아웃 로직
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 앱 버전
              Text(
                '버전 1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.amber.shade700, // 진한 노랑 텍스트
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color,
      {required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String emoji, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade100.withOpacity(0.5), // 노랑 그림자
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
            border: Border.all(
              color: Colors.amber.shade100, // 연노랑 테두리
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color,
      {required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
