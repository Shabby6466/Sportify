import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:sportify/presentations/pages/calendar/calendar.dart';
import 'package:sportify/presentations/pages/home/home_screen.dart';
import 'package:sportify/presentations/pages/calorie_calc/calorie.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final selectedColors = Colors.yellow;
  final List<Widget> bodies = [
    const HomeScreen(),
    const CalorieCalculator(),
    const Calendar(),
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color unselectedColor = Colors.white;
    return SafeArea(
      child: Scaffold(
        body: bodies[currentPage],
        bottomNavigationBar: BottomBar(
          barColor: Colors.black.withOpacity(0.5),
          start: 1,
          borderRadius: BorderRadius.circular(300),
          body: (BuildContext context, ScrollController controller) {
            return bodies[currentPage];
          },
          hideOnScroll: true,
          child: TabBar(
            controller: tabController,
            tabs: [
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Icon(
                  Icons.home,
                  color: currentPage == 0 ? selectedColors : unselectedColor,
                )),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Icon(
                  Icons.search,
                  color: currentPage == 1 ? selectedColors : unselectedColor,
                )),
              ),
              SizedBox(
                height: 55,
                width: 40,
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: currentPage == 2 ? selectedColors : unselectedColor,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
