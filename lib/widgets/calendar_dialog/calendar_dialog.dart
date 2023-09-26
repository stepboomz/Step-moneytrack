// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stepmoney/constants/colors.dart';
import 'package:stepmoney/helpers/datetime_helper.dart';
import 'package:stepmoney/helpers/duration_helper.dart';

part './calendar_dialog_header.dart';
part './calendar_dialog_day_grid.dart';
part './calendar_dialog_month_grid.dart';
part './calendar_dialog_year_grid.dart';
part './calendar_dialog_footer.dart';

enum CalendarState { pickDay, pickMonth, pickYear }

class CalendarDialog extends StatefulWidget {
  const CalendarDialog({
    Key? key,
    this.startDate,
  }) : super(key: key);

  final DateTime? startDate;

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog>
    with TickerProviderStateMixin {
  late DateTime date;
  late CalendarState state;
  late final AnimationController _controller;

  @override
  void initState() {
    date = widget.startDate ?? DateTime.now();
    state = CalendarState.pickDay;
    _controller = AnimationController(
      duration: 300.millisecond,
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  void changeDate({int? day, int? month, int? year}) {
    setState(() {
      date = DateTime(year ?? date.year, month ?? date.month, day ?? date.day);
    });
  }

  void changeState(CalendarState newState) {
    setState(() {
      _controller.reset();
      state = newState;
      _controller.forward();
    });
  }

  Widget getCalendarGrid() {
    switch (state) {
      case CalendarState.pickDay:
        return CalendarDayGrid(
          date: date,
          changeDate: changeDate,
        );
      case CalendarState.pickMonth:
        return CalendarMonthGrid(
          date: date,
          changeDate: changeDate,
          changeState: changeState,
        );
      case CalendarState.pickYear:
        return CalendarYearGrid(
          date: date,
          changeDate: changeDate,
          changeState: changeState,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFFFFFFF),
      insetPadding: const EdgeInsets.symmetric(vertical: 200, horizontal: 24),
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CalendarDialogHeader(date: date, changeState: changeState),
            state == CalendarState.pickDay
                ? const CalendarDay()
                : const SizedBox(height: 16.0),
            Expanded(
              child: FadeTransition(
                opacity: CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: _controller,
                ),
                child: getCalendarGrid(),
              ),
            ),
            CalendarDialogFooter(date: date)
          ],
        ),
      ),
    );
  }
}
