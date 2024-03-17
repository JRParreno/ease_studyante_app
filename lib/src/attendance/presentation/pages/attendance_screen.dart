import 'package:ease_studyante_app/src/attendance/presentation/pages/widgets/attendance_item.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({
    super.key,
  });

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Widget> attendanceItems = [
    AttendanceItemWidget(
      name: 'Den Fuerte',
      date: DateTime.now(),
      status: 'Present',
    ),
    AttendanceItemWidget(
      name: 'Juan Dela Cruz',
      date: DateTime.now(),
      status: 'Tardy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) => attendanceItems[index],
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(thickness: 3),
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}
