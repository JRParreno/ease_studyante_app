import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ease_studyante_app/core/bloc/bloc/global_bloc.dart';

import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/gen/colors.gen.dart';
import 'package:ease_studyante_app/src/chat/presentation/pages/chat_screen.dart';

import 'package:ease_studyante_app/src/subject/presentation/pages/subject_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);
  late GlobalBloc globalBloc;
  List<Widget> screens = const [
    SubjectScreen(),
    ChatScreen(),
  ];

  final iconList = <IconData>[
    Icons.home,
    Icons.chat_bubble,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, index, child) {
        return Scaffold(
          body: screens.elementAt(index),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            height: 60,
            icons: iconList,
            activeIndex: index,
            leftCornerRadius: 20,
            rightCornerRadius: 20,
            activeColor: Colors.white,
            inactiveColor: ColorName.placeHolder,
            backgroundColor: ColorName.primary,
            onTap: (currentIndex) {
              selectedIndex.value = currentIndex;
            },
            gapLocation: GapLocation.none,
          ),
        );
      },
    );
  }
}
