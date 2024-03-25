import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/common_widget/spaced_row_widget.dart';
import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';

class GradingComponentTileWidget extends StatelessWidget {
  final String componentTitle;
  final List<Widget> componentItems;
  const GradingComponentTileWidget({
    super.key,
    required this.componentTitle,
    required this.componentItems,
  });

  @override
  Widget build(BuildContext context) {
    String gpa = '';

    return SpacedColumn(
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
                componentTitle,
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
        SizedBox(
          height: componentItems.length * 60,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => componentItems[index],
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: componentItems.length,
          ),
        ),
      ],
    );
  }
}
