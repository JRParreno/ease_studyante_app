import 'package:ease_studyante_app/core/resources/theme/theme.dart';
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

  List<Widget> screens = const [
    SubjectScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, index, child) {
        return Scaffold(
          body: screens.elementAt(index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedIconTheme: const IconThemeData(
              color: ColorSchemes.red,
            ),
            selectedItemColor: ColorSchemes.red,
            unselectedItemColor: ColorSchemes.bodyLabel,
            unselectedIconTheme: const IconThemeData(
              color: ColorSchemes.bodyLabel,
            ),
            unselectedLabelStyle: const TextStyle(
              color: ColorSchemes.bodyLabel,
              fontSize: 8,
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
            ),
            selectedLabelStyle: const TextStyle(
              color: ColorSchemes.red,
              fontSize: 8,
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
            ),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Subject',
                icon: Icon(
                  Icons.list_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Chat',
                icon: Icon(
                  Icons.chat_bubble,
                ),
              ),
            ],
            onTap: (currentIndex) {
              selectedIndex.value = currentIndex;
            },
          ),
        );
      },
    );
  }
}
