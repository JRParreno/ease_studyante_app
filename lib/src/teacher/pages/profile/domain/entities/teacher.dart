import 'dart:convert';

import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final String pk;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String department;
  final String? profilePhoto;

  const Teacher({
    required this.pk,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.department,
    this.profilePhoto,
  });

  Teacher copyWith({
    String? pk,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? department,
    String? profilePhoto,
  }) {
    return Teacher(
      pk: pk ?? this.pk,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      department: department ?? this.department,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pk': pk});
    result.addAll({'username': username});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'email': email});
    result.addAll({'department': department});
    if (profilePhoto != null) {
      result.addAll({'profilePhoto': profilePhoto});
    }

    return result;
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      pk: map['pk'] ?? '',
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      department: map['department'] ?? '',
      profilePhoto: map['profilePhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        pk,
        username,
        firstName,
        lastName,
        email,
        department,
        profilePhoto,
      ];
}
