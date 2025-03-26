import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:dulit_client/common/const/colors.dart';
import 'package:dulit_client/home/model/anniversary_model.dart';
import 'package:dulit_client/home/provider/anniversary_provider.dart';

class CreateAnniversaryDialog extends ConsumerStatefulWidget {
  const CreateAnniversaryDialog({super.key});

  @override
  ConsumerState<CreateAnniversaryDialog> createState() =>
      _CreateAnniversaryDialogState();
}

class _CreateAnniversaryDialogState
    extends ConsumerState<CreateAnniversaryDialog> {
  late TextEditingController dateController;
  late TextEditingController titleController;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    dateController = TextEditingController();
    titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 10)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.cancel, color: BODY_TEXT_COLOR),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "우리의 D-Day",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: '제목',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                    dateController.text =
                        "${selectedDate.toLocal()}".split(' ')[0];
                  });
                }
              },
              child: TextField(
                controller: dateController,
                enabled: false,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.black),
                  hintText: '날짜',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text;
                DateTime date =
                    DateFormat("yyyy-MM-dd").parse(dateController.text);

                ref.read(anniversaryProvider.notifier).addAnniversary(
                    AnniversaryModel(id: 1, title: title, date: date));

                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BODY_TEXT_COLOR),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
              child: const Text("추가하기",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
