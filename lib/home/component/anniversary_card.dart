import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/home/model/anniversary_model.dart';

class AnniversaryCard extends StatelessWidget {
  final AnniversaryModel anniversaryModel;
  const AnniversaryCard({super.key, required this.anniversaryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // rounded-2xl에 해당
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            anniversaryModel.title,
            style: const TextStyle(
                fontSize: 24, color: TEXT_COLOR, fontWeight: FontWeight.bold),
          ),
          const Text(
            '❤️',
            style: TextStyle(
                fontSize: 30, // text-2xl에 해당하는 크기
                color: Colors.red),
          ),
          Column(
            children: [
              Text(
                '${getDifferenceDay(anniversaryModel.date)}일',
                style: const TextStyle(
                    fontSize: 18,
                    color: TEXT_COLOR,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(anniversaryModel.date),
                style: const TextStyle(
                    fontSize: 14,
                    color: SUB_TEXT_COLOR,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

String getDifferenceDay(DateTime date) {
  DateTime today = DateTime.now();

  DateTime todayDate = DateTime(today.year, today.month, today.day);
  DateTime anniversaryDate = DateTime(date.year, date.month, date.day);

  int daysDifference = todayDate.difference(anniversaryDate).inDays;

  return daysDifference > -1 ? '+${daysDifference + 1}' : '$daysDifference';
}
