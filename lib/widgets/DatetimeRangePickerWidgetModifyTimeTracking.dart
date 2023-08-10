import 'package:argon_flutter/models/TimeTracking.dart';
import 'package:argon_flutter/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeRangePickerWidgetModifyTimeTracking extends StatefulWidget {
  @override
  _DatetimeRangePickerWidgetModifyTimeTrackingState createState() =>
      _DatetimeRangePickerWidgetModifyTimeTrackingState();
}

class _DatetimeRangePickerWidgetModifyTimeTrackingState extends State<DatetimeRangePickerWidgetModifyTimeTracking> {
  DateTime dateTimeUntil = DateFormat('MM/dd/yyyy HH:mm').parse(untilTM);
  DateTime dateTimeFrom = DateFormat('MM/dd/yyyy HH:mm').parse(fromTM);
  String getTextFrom() {
    if (dateTimeFrom == null) {
      return 'From';
    } else {
      if (dateTimeUntil.difference(dateTimeFrom).inDays == 0) {
        editTT = false;
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeFrom);
      }
      if (dateTimeUntil.difference(dateTimeFrom).inDays >= 1) {
        editTT = true;
        fromTM = DateFormat('MM/dd/yyyy HH:mm').format(dateTimeFrom);
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeFrom);
      }
      if (dateTimeUntil.difference(dateTimeFrom).inDays <= -1) {
        editTT = false;
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeFrom);
      }
      return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeFrom);
    }
  }

  Future pickDateTimeFrom(BuildContext context) async {
    final date = await pickDateFrom(context);
    if (date == null) return;

    final time = await pickTimeFrom(context);
    if (time == null) return;

    setState(() {
      dateTimeFrom = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDateFrom(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTimeFrom ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTimeFrom(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTimeFrom != null ? TimeOfDay(hour: dateTimeFrom.hour, minute: dateTimeFrom.minute) : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  String getTextUntil() {
    if (dateTimeUntil == null) {
      return 'Until';
    } else {
      if (dateTimeUntil.difference(dateTimeFrom).inDays == 0) {
        editTT = false;
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeUntil);
      }
      if (dateTimeUntil.difference(dateTimeFrom).inDays >= 1) {
        editTT = true;
        untilTM = DateFormat('MM/dd/yyyy HH:mm').format(dateTimeUntil);
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeUntil);
      }
      if (dateTimeUntil.difference(dateTimeFrom).inDays <= -1) {
        editTT = false;
        return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeUntil);
      }

      return DateFormat('MM/dd/yyyy HH:mm').format(dateTimeUntil);
    }
  }

  Future pickDateTimeUntil(BuildContext context) async {
    final date = await pickDateUntil(context);
    if (date == null) return;

    final time = await pickTimeUntil(context);
    if (time == null) return;

    setState(() {
      dateTimeUntil = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDateUntil(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTimeUntil ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTimeUntil(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime:
          dateTimeUntil != null ? TimeOfDay(hour: dateTimeUntil.hour, minute: dateTimeUntil.minute) : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: '',
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                text: (dateTimeFrom == null) ? fromTM : getTextFrom(),
                onClicked: () => pickDateTimeFrom(context),
              ),
            ),
            const SizedBox(width: 5),
            Icon(Icons.arrow_forward, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: ButtonWidget(
                text: (dateTimeUntil == null) ? untilTM : getTextUntil(),
                onClicked: () => pickDateTimeUntil(context),
              ),
            ),
          ],
        ),
      );
}
