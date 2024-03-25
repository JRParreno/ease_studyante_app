import 'package:ease_studyante_app/core/common_widget/common_widget.dart';
import 'package:ease_studyante_app/core/common_widget/custom_appbar.dart';
import 'package:ease_studyante_app/gen/colors.gen.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/section.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/student.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StudentDetailArgs {
  final Section section;
  final Student student;

  StudentDetailArgs({
    required this.section,
    required this.student,
  });
}

class StudentDetailPage extends StatefulWidget {
  static const String routeName = 'teacher/student/detail';
  final StudentDetailArgs args;

  const StudentDetailPage({super.key, required this.args});

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  late Student student;
  late Section section;

  @override
  void initState() {
    super.initState();
    student = widget.args.student;
    section = widget.args.section;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Student Detail'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .10,
                  decoration: const BoxDecoration(
                    color: ColorName.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.35,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 55,
                    child: CircleAvatar(
                      backgroundColor: ColorName.primary,
                      backgroundImage: student.profilePhoto != null
                          ? Image.network(student.profilePhoto!).image
                          : null,
                      radius: 50,
                      child: student.profilePhoto != null
                          ? null
                          : const Icon(
                              Icons.person,
                              size: 65,
                              color: Colors.white,
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomText(
            text: '${student.user.lastName}, ${student.user.firstName}'
                .toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Student Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Divider(
                        color: ColorName.primary,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            listTile(title: 'Email:', data: student.user.email),
                            listTile(title: 'Section:', data: section.name),
                            listTile(
                                title: 'Year Level:', data: section.yearLevel),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomBtn(
                        label: 'View Attendance',
                        onTap: () {},
                      ),
                      const Gap(10),
                      CustomBtn(
                        label: 'View Grades',
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listTile({
    required String title,
    required String data,
  }) {
    return Row(
      children: [
        CustomText(
          text: title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(5),
        CustomText(text: data),
      ],
    );
  }
}
