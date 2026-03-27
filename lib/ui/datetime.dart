import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeSelector extends StatefulWidget {
  const DateTimeSelector({
    super.key,
    this.dateTime,
    required this.onConfirm,
    required this.onDelete,
  });

  final DateTime? dateTime;
  final void Function(DateTime dt) onConfirm;
  final void Function() onDelete;

  @override
  State<DateTimeSelector> createState() => _DateTimeSelector();
}

class _DateTimeSelector extends State<DateTimeSelector> {
  final now = DateTime.now();
  late final defaultTime = (widget.dateTime != null) ? widget.dateTime : now;

  late int year = defaultTime!.year - now.year;
  late int month = defaultTime!.month - 1;
  late int day = defaultTime!.day - 1;
  late int hour = defaultTime!.hour;
  late int minute = defaultTime!.minute;

  final monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  bool isLeap(int year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  int getMonthDays(int month) {
    int days = monthDays[month];

    if (isLeap(now.year + year) && month == 2) {
      days = 29;
    }

    return days;
  }

  late final FixedExtentScrollController _yearController;
  late final FixedExtentScrollController _monthController;
  late final FixedExtentScrollController _dayController;
  late final FixedExtentScrollController _hourController;
  late final FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    _yearController = FixedExtentScrollController(initialItem: year);
    _monthController = FixedExtentScrollController(initialItem: month);
    _dayController = FixedExtentScrollController(initialItem: day);
    _hourController = FixedExtentScrollController(initialItem: hour);
    _minuteController = FixedExtentScrollController(initialItem: minute);
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = getMonthDays(month);

    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onDelete();
                  },
                  child: const Text("削除", style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onConfirm(
                      DateTime(
                        year + now.year,
                        month + 1,
                        day + 1,
                        hour,
                        minute,
                      ),
                    );
                  },
                  child: const Text("完了"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() => year = value);
                    },
                    itemExtent: 30,
                    scrollController: _yearController,
                    children: [
                      for (int i = 0; i <= 100; i++) Text('${now.year + i}年'),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() => month = value);
                    },
                    itemExtent: 30,
                    scrollController: _monthController,
                    children: [for (int i = 0; i < 12; i++) Text('${i + 1}月')],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() => day = value);
                    },
                    itemExtent: 30,
                    scrollController: _dayController,
                    children: [
                      for (int i = 0; i < days; i++) Text('${i + 1}日'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() => hour = value);
                    },
                    itemExtent: 30,
                    scrollController: _hourController,
                    children: [
                      for (int i = 0; i < 24; i++)
                        Text(i.toString().padLeft(2, '0')),
                    ],
                  ),
                ),
                const Text(":"),
                Expanded(
                  child: CupertinoPicker(
                    onSelectedItemChanged: (value) {
                      setState(() => minute = value);
                    },
                    itemExtent: 30,
                    scrollController: _minuteController,
                    children: [
                      for (int i = 0; i < 60; i++)
                        Text(i.toString().padLeft(2, '0')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
