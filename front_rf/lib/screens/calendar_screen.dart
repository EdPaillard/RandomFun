import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 200, 30),
        title: const Text("❤️  RandomFun"),
      ),
      body: SfCalendar(
        dataSource: _getCalendarDataSource(),
        allowDragAndDrop: true,
        showNavigationArrow: true,
        cellBorderColor: const Color.fromARGB(179, 255, 199, 30),
        todayHighlightColor: const Color.fromARGB(255, 255, 200, 30),
        selectionDecoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 255, 200, 30), width: 2),
        ),
        view: CalendarView.month,
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month
        ],
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true,
          navigationDirection: MonthNavigationDirection.horizontal,
          monthCellStyle: MonthCellStyle(
            leadingDatesBackgroundColor: Color.fromARGB(115, 255, 190, 0),
            trailingDatesBackgroundColor: Color.fromARGB(115, 255, 190, 0),
          ),
        ),
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(
    Appointment(
      isAllDay: true,
      startTime: DateTime.now(),
      endTime: DateTime.now().add(
        const Duration(hours: 2),
      ),
      subject: 'Meeting',
      color: Colors.blue.shade200,
    ),
  );

  return _AppointmentDataSource(appointments);
}
