import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../core/app_colors.dart';

class HorariosPage extends StatefulWidget {
  const HorariosPage({Key? key}) : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.corPrimaria,
          title: const Text(
            'Horarios',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SfCalendar(
          view: CalendarView.day,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();

    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 7, 40, 0);
    final DateTime startTime2 =
        DateTime(today.year, today.month, today.day, 11, 30, 0);

    final DateTime endTime =
        startTime.add(const Duration(hours: 3, minutes: 40));
    final DateTime endTime2 =
        startTime.add(const Duration(hours: 5, minutes: 20));

    meetings.add(Meeting(
        'Lab Engenharia de Software', startTime, endTime, Colors.blue, false));
    meetings.add(Meeting(
        'Estrutura de Dados', startTime2, endTime2, Colors.orange, false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
