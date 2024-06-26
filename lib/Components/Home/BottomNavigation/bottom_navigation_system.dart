import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_app/Store/global_state_management.dart';

class HomeBottomNavigationSystem extends StatefulWidget {
  const HomeBottomNavigationSystem({super.key});

  @override
  State<HomeBottomNavigationSystem> createState() =>
      _HomeBottomNavigationSystemState();
}

class _HomeBottomNavigationSystemState
    extends State<HomeBottomNavigationSystem> {
  @override
  Widget build(BuildContext context) {
    final globalStateHandler = Provider.of<GlobalStateHandler>(context);

    return BottomNavigationBar(
      currentIndex: globalStateHandler.selectHomePage,
      onTap: (value) {
        setState(() {
          Provider.of<GlobalStateHandler>(context, listen: false)
              .setSelectedHomePage(value);
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_today,
          ),
          label: '',
        )
      ],
    );
  }
}
