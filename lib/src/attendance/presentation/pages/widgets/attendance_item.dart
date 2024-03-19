import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/common_widget/spaced_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceItemWidget extends StatelessWidget {
  final String name;
  final DateTime date;
  final String status;
  const AttendanceItemWidget({
    super.key,
    required this.name,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd('en_US').format(date);
    final formattedTime = DateFormat.Hms().format(date);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
      child: SpacedColumn(
        spacing: 20,
        children: [
          SpacedRow(
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                'Date: $formattedDate',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SpacedRow(
            children: [
              Text(
                'Status: $status',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                'Time In: $formattedTime',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
