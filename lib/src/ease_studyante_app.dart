import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/core/routes/routes.dart';
import 'package:ease_studyante_app/src/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EaseStudyanteApp extends StatefulWidget {
  const EaseStudyanteApp({super.key});
  static final navKey = GlobalKey<NavigatorState>();

  @override
  State<EaseStudyanteApp> createState() => _EaseStudyanteAppState();
}

class _EaseStudyanteAppState extends State<EaseStudyanteApp> {
  bool isNeedOnBoarded = true;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: EaseStudyanteApp.navKey,
          themeMode: ThemeMode.light,
          darkTheme: MaterialAppThemes.lightTheme,
          theme: MaterialAppThemes.lightTheme,
          onGenerateRoute: generateRoute,
          home: const HomeScreen(), //LandingPage(),
        );
      },
    );
  }
}
