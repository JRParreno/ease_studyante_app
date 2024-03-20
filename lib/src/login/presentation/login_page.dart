import 'package:ease_studyante_app/src/home/presentation/pages/home_screen.dart';
import 'package:ease_studyante_app/src/schedule/repository/schedule_repository.dart';
import 'package:ease_studyante_app/src/schedule/repository/schedule_repository_impl.dart';
import 'package:ease_studyante_app/src/subject/presentation/blocs/bloc/subject_bloc.dart';
import 'package:ease_studyante_app/src/teacher/bloc/teacher_bloc.dart';
import 'package:ease_studyante_app/src/teacher/teacher_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/common_widget/custom_appbar.dart';
import '../data/data_sources/login_repository_impl.dart';
import 'bloc/login_bloc.dart';
import 'widgets/login_footer.dart';
import 'widgets/login_body.dart';
import 'widgets/login_header.dart';

class LoginArgs {
  final bool isTeacher;
  final bool isStudent;

  LoginArgs({
    required this.isTeacher,
    required this.isStudent,
  });
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  static const String routeName = '/account/login';
  final LoginArgs args;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    // emailCtrl.text = 'denstudent@deped.com';
    // passwordCtrl.text = 'asd000!!';
    loginBloc = LoginBloc(LoginRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
        ),
        body: ProgressHUD(
          child: Builder(builder: (context) {
            final progressHUD = ProgressHUD.of(context);

            return BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  progressHUD?.show();
                }

                if (state is LoginSuccess || state is LoginError) {
                  progressHUD?.dismiss();

                  if (state is LoginSuccess) {
                    handleNavigate();
                  }

                  if (state is LoginError) {
                    handleErrorMessage(state.errorMessage);
                  }
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LoginHeader(
                      title:
                          'Login ${widget.args.isTeacher ? 'Teacher' : 'Student/Parent'}',
                    ),
                    const Gap(15),
                    LoginBody(
                      formKey: _formKey,
                      emailCtrl: emailCtrl,
                      passwordCtrl: passwordCtrl,
                      onSubmit: handleSubmit,
                      passwordVisible: _passwordVisible,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const LoginFooter(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Add student support !widget.args.isTeacher
      // add checkbox for parent?

      loginBloc.add(
        OnSubmitLoginEvent(
          emailAddress: emailCtrl.value.text,
          password: passwordCtrl.value.text,
          isTeacher: widget.args.isTeacher,
          isStudent: widget.args.isStudent,
        ),
      );
    }
  }

  void handleErrorMessage(String errorMessage) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: errorMessage,
      ),
    );
  }

  void handleNavigate() {
    if (widget.args.isTeacher) {
      BlocProvider.of<TeacherBloc>(context).add(OnGetTeacherProfileEvent());

      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const TeacherHomePage()),
        ModalRoute.withName('/'),
      );
    } else {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              RepositoryProvider<ScheduleRepository>(
            create: (context) => ScheduleRepositoryImpl(),
            child: BlocProvider<SubjectBloc>(
              create: (context) => SubjectBloc(
                scheduleRepository:
                    RepositoryProvider.of<ScheduleRepository>(context),
              ),
              child: const HomeScreen(),
            ),
          ),
        ),
        ModalRoute.withName('/'),
      );
    }
    // return student view home
  }
}
