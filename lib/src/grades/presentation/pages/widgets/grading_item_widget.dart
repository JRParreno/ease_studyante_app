import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/common_widget/spaced_row_widget.dart';
import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/grading_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GradingItemWidget extends StatelessWidget {
  final String gradingPeriod;
  const GradingItemWidget({
    super.key,
    required this.gradingPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 250),
            type: PageTransitionType.fade,
            child: GradingDetailScreen(gradingPeriod: gradingPeriod),
          ),
        );
      },
      child: SpacedColumn(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorSchemes.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: SpacedRow(
              children: [
                Text(
                  gradingPeriod,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Text(
                  '99.99%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.bodyLabel.withOpacity(0.3),
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
            child: const Text(
              'View Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
