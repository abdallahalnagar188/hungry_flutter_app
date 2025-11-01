import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerBottomSheet extends StatefulWidget {
  const DateRangePickerBottomSheet({super.key});

  @override
  State<DateRangePickerBottomSheet> createState() =>
      _DateRangePickerBottomSheetState();
}

class _DateRangePickerBottomSheetState
    extends State<DateRangePickerBottomSheet> {
  late DateTime currentMonth;
  DateTime? startDate;
  DateTime? endDate;

  final List<String> monthsArabic = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ];

  final List<String> daysArabic = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة'
  ];

  @override
  void initState() {
    super.initState();
    currentMonth = DateTime(2025, 8); // August 2025
  }

  int getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  List<DateItem> generateCalendarDays() {
    final daysInMonth = getDaysInMonth(currentMonth);
    final firstDay = getFirstDayOfMonth(currentMonth);
    final List<DateItem> days = [];

    // Previous month's days
    final prevMonthDays =
        getDaysInMonth(DateTime(currentMonth.year, currentMonth.month - 1));
    for (int i = firstDay - 1; i >= 0; i--) {
      days.add(
        DateItem(
          day: prevMonthDays - i,
          isCurrentMonth: false,
          date: DateTime(
              currentMonth.year, currentMonth.month - 1, prevMonthDays - i),
        ),
      );
    }

    // Current month's days
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(
        DateItem(
          day: i,
          isCurrentMonth: true,
          date: DateTime(currentMonth.year, currentMonth.month, i),
        ),
      );
    }

    // Next month's days
    final remainingDays = 42 - days.length;
    for (int i = 1; i <= remainingDays; i++) {
      days.add(
        DateItem(
          day: i,
          isCurrentMonth: false,
          date: DateTime(currentMonth.year, currentMonth.month + 1, i),
        ),
      );
    }

    return days;
  }

  bool isDateInRange(DateTime date) {
    if (startDate == null || endDate == null) return false;
    final start = DateTime(
        startDate!.year, startDate!.month, startDate!.day);
    final end = DateTime(endDate!.year, endDate!.month, endDate!.day);
    final minDate = start.isBefore(end) ? start : end;
    final maxDate = start.isBefore(end) ? end : start;
    final checkDate = DateTime(date.year, date.month, date.day);
    return checkDate.isAfter(minDate) && checkDate.isBefore(maxDate);
  }

  bool isDateSelected(DateTime date) {
    final checkDate = DateTime(date.year, date.month, date.day);
    final start = startDate != null
        ? DateTime(startDate!.year, startDate!.month, startDate!.day)
        : null;
    final end = endDate != null
        ? DateTime(endDate!.year, endDate!.month, endDate!.day)
        : null;
    return (start != null && checkDate == start) ||
        (end != null && checkDate == end);
  }

  void handleDateClick(DateTime date) {
    final checkDate = DateTime(date.year, date.month, date.day);
    
    if (startDate == null) {
      setState(() => startDate = checkDate);
    } else if (endDate == null) {
      if (checkDate !=
          DateTime(startDate!.year, startDate!.month, startDate!.day)) {
        setState(() => endDate = checkDate);
      }
    } else {
      setState(() {
        startDate = checkDate;
        endDate = null;
      });
    }
  }

  void resetDates() {
    setState(() {
      startDate = null;
      endDate = null;
    });
  }

  void previousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = generateCalendarDays();
    final weeks = <List<DateItem>>[];
    for (int i = 0; i < days.length; i += 7) {
      weeks.add(days.sublist(i, i + 7));
    }

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: 24 + MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.chevron_left,
                          color: Colors.blue, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'اختر التاريخ',
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${monthsArabic[currentMonth.month - 1]} ${currentMonth.year}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Month Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: nextMonth,
                    icon: const Icon(Icons.chevron_right,
                        color: Colors.grey, size: 24),
                  ),
                  IconButton(
                    onPressed: previousMonth,
                    icon: const Icon(Icons.chevron_left,
                        color: Colors.grey, size: 24),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Days of week header
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: daysArabic
                    .map(
                      (day) => Center(
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Calendar days
              ...weeks.map((week) {
                return Column(
                  children: [
                    GridView.count(
                      crossAxisCount: 7,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: week
                          .map((dayObj) {
                            final isSelected = isDateSelected(dayObj.date);
                            final inRange = isDateInRange(dayObj.date);

                            return GestureDetector(
                              onTap: dayObj.isCurrentMonth
                                  ? () => handleDateClick(dayObj.date)
                                  : null,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.blue[600]
                                      : inRange
                                          ? Colors.blue[100]
                                          : dayObj.isCurrentMonth
                                              ? Colors.transparent
                                              : Colors.transparent,
                                  shape: isSelected
                                      ? BoxShape.circle
                                      : BoxShape.rectangle,
                                  borderRadius: isSelected
                                      ? null
                                      : BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    '${dayObj.day}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : dayObj.isCurrentMonth
                                              ? Colors.black
                                              : Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              }).toList(),

              const SizedBox(height: 24),

              // Quick Selection Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildQuickButton('الشهر'),
                    const SizedBox(width: 8),
                    _buildQuickButton('آخر 30 يوم'),
                    const SizedBox(width: 8),
                    _buildQuickButton('هذا الأسبوع',
                        isSelected: true),
                    const SizedBox(width: 8),
                    _buildQuickButton('هذا اليوم'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'اختيار',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: resetDates,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text(
                        'الحذف',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickButton(String label, {bool isSelected = false}) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(
          color: isSelected ? Colors.blue[600]! : Colors.grey[300]!,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.blue[600] : Colors.grey[700],
          fontSize: 14,
        ),
      ),
    );
  }
}

class DateItem {
  final int day;
  final bool isCurrentMonth;
  final DateTime date;

  DateItem({
    required this.day,
    required this.isCurrentMonth,
    required this.date,
  });
}

// To use in your app:
// showModalBottomSheet(
//   context: context,
//   isScrollControlled: true,
//   builder: (context) => const DateRangePickerBottomSheet(),
// );