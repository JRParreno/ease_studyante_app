import 'package:ease_studyante_app/src/subject/presentation/pages/subject_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SubjectItemWidget extends StatelessWidget {
  final String name;

  const SubjectItemWidget({
    super.key,
    required this.name,
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
            child: SubjectDetailScreen(name: name),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
