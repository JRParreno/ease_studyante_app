import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/section.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/subject.dart';

class TeacherSchedule extends Equatable {
  final String id;
  final Subject subject;
  final Section section;
  final String day;
  final String timeStart;
  final String timeEnd;

  const TeacherSchedule({
    required this.id,
    required this.subject,
    required this.section,
    required this.day,
    required this.timeStart,
    required this.timeEnd,
  });

  @override
  List<Object> get props {
    return [
      id,
      subject,
      section,
      day,
      timeStart,
      timeEnd,
    ];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'subject': subject.toMap()});
    result.addAll({'section': section.toMap()});
    result.addAll({'day': day});
    result.addAll({'timeStart': timeStart});
    result.addAll({'timeEnd': timeEnd});

    return result;
  }

  factory TeacherSchedule.fromMap(Map<String, dynamic> map) {
    return TeacherSchedule(
      id: map['id'] ?? '',
      subject: Subject.fromMap(map['subject']),
      section: Section.fromMap(map['section']),
      day: map['day'] ?? '',
      timeStart: map['time_start'] ?? '',
      timeEnd: map['time_end'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherSchedule.fromJson(String source) =>
      TeacherSchedule.fromMap(json.decode(source));

  factory TeacherSchedule.empty() {
    return TeacherSchedule(
      day: '',
      id: '',
      section: Section.empty(),
      subject: Subject.empty(),
      timeEnd: '',
      timeStart: '',
    );
  }
}
