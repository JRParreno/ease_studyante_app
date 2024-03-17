import 'package:ease_studyante_app/src/landing/presentation/landing_page.dart';
import 'package:ease_studyante_app/src/teacher/pages/qr_code/presentation/teacher_qr_code_scanner.dart';
import 'package:ease_studyante_app/src/teacher/teacher_home.dart';
import 'package:flutter/material.dart';

import '../../src/forgot_password/forgot_password_page.dart';
import '../../src/login/presentation/login_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      switch (settings.name) {
        case LandingPage.routeName:
          return const LandingPage();
        case LoginPage.routeName:
          final args = settings.arguments! as LoginArgs;
          return LoginPage(
            args: args,
          );
        case ForgotPasswordPage.routeName:
          return const ForgotPasswordPage();
        case TeacherHomePage.routeName:
          return const TeacherHomePage();
        case TeacherQRCodeScanner.routeName:
          return const TeacherQRCodeScanner();
      }

      return const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Text('Something went wrong'),
        ),
      );
    },
  );
}
