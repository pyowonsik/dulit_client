import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dulit_client/common/layout/default_layout.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

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
            // 상단 타이틀
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '데이트 기록',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade700,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // 캘린더 위젯
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shadowColor: Colors.amber.shade100.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.orange.shade500,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.amber.shade400,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      weekendTextStyle: TextStyle(
                        color: Colors.amber.shade700,
                      ),
                      defaultTextStyle: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade700,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.amber.shade700,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.amber.shade700,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                      weekendStyle: TextStyle(
                        color: Colors.amber.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 선택된 날짜 표시
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade600,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${_selectedDay.year}년 ${_selectedDay.month}월 ${_selectedDay.day}일',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '의 우리의 기록',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        // 새 기록 추가 로직
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.amber.shade700,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 데이트 기록 카드
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Card(
            //     elevation: 4,
            //     shadowColor: Colors.amber.shade100.withOpacity(0.5),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // 이미지
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(8),
            //             child: Image.network(
            //               'https://picsum.photos/350/350',
            //               height: 200,
            //               width: double.infinity,
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //           const SizedBox(height: 12),

            //           // 날짜
            //           Text(
            //             '2025년 2월 13일',
            //             style: TextStyle(
            //               color: Colors.grey.shade600,
            //               fontSize: 14,
            //             ),
            //           ),
            //           const SizedBox(height: 4),

            //           // 제목
            //           const Text(
            //             '병원 데이트',
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           const SizedBox(height: 12),

            //           // 버튼 영역
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               TextButton(
            //                 onPressed: () {
            //                   // 더보기 로직
            //                 },
            //                 child: Text(
            //                   '더보기 >',
            //                   style: TextStyle(
            //                     color: Colors.amber.shade700,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //               TextButton(
            //                 onPressed: () {
            //                   // 삭제 로직
            //                 },
            //                 child: const Text(
            //                   '삭제하기',
            //                   style: TextStyle(
            //                     color: Colors.red,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            // 하단 네비게이션 바
            // const Spacer(),
            // _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
