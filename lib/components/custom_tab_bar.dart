import 'package:flutter/material.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';

class CustomTabBar extends StatefulWidget {
  final int currentTab;
  final Function tabClick;

  const CustomTabBar(
      {super.key, required this.currentTab, required this.tabClick});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedTab = 1;
  double bgX = -1;

  int animDuration = 200;

  final tabButton0 = GlobalKey();
  final tabButton1 = GlobalKey();
  final tabButton2 = GlobalKey();

  void setBoxPosition(int tab) {
    var tabButton = tabButton1;

    if (tab == 0) {
      tabButton = tabButton0;
    } else if (tab == 2) {
      tabButton = tabButton2;
    }

    final RenderBox box =
        tabButton.currentContext?.findRenderObject() as RenderBox;

    Offset position = box.localToGlobal(Offset.zero);
    final x = position.dx + box.size.width / 2 - 24;

    if (selectedTab - tab > 1 || tab - selectedTab > 1) {
      animDuration = 300;
    } else {
      animDuration = 200;
    }

    selectedTab = tab;
    bgX = x;
  }

  void changeSelectedTab(int tab) {
    setBoxPosition(tab);

    widget.tabClick(tab);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: Border(
              top: BorderSide(
                  width: 1.0,
                  color: Theme.of(context).colorScheme.primaryContainer))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            left: bgX >= 0 ? bgX : MediaQuery.of(context).size.width / 2 - 24,
            duration: Duration(milliseconds: animDuration),
            curve: Curves.easeInOut,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 107, 99, 254),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                key: tabButton0,
                onPressed: () => {changeSelectedTab(0)},
                icon: Icon(
                  MyFlutterApp.users,
                  color: selectedTab == 0
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyMedium?.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 24),
              IconButton(
                key: tabButton1,
                onPressed: () => {changeSelectedTab(1)},
                icon: Icon(MyFlutterApp.link_rotated,
                    color: selectedTab == 1
                        ? Colors.white
                        : Theme.of(context).textTheme.bodyMedium?.color,
                    size: 24),
              ),
              const SizedBox(width: 24),
              IconButton(
                key: tabButton2,
                onPressed: () => {changeSelectedTab(2)},
                icon: Icon(
                  MyFlutterApp.user,
                  color: selectedTab == 2
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyMedium?.color,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
