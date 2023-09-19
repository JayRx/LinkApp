import 'package:flutter/material.dart';
import 'package:linkapp/components/animated_action_button.dart';
import 'package:linkapp/components/custom_tab_bar.dart';
import 'package:linkapp/pages/link_form_page.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';
import 'package:linkapp/pages/main_page.dart';
import 'package:linkapp/components/action_button.dart';

class CustomTabBarManager extends StatefulWidget {
  const CustomTabBarManager({super.key});

  @override
  State<CustomTabBarManager> createState() => _CustomTabBarManagerState();
}

class _CustomTabBarManagerState extends State<CustomTabBarManager> {
  int selectedTab = 1;

  bool mainScreenActive = true;
  bool addButtonActive = false;

  final controller = PageController(initialPage: 1);

  void changeSelectedTab(int tab) {
    controller.jumpToPage(tab);

    changeSelectedTabPage(tab);
  }

  void changeSelectedTabPage(int tab) {
    setState(() {
      selectedTab = tab;

      if (tab != 1) {
        addButtonActive = false;
        mainScreenActive = false;
      } else {
        mainScreenActive = true;
      }
    });
  }

  void addButtonClick() {
    setState(() {
      addButtonActive = !addButtonActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) => {changeSelectedTabPage(index)},
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Center(child: Text("Groups")),
            MainPage(),
            Center(child: Text("User"))
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          top: addButtonActive ? 0 : MediaQuery.of(context).size.height,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer),
            child: const LinkFormPage(),
          ),
        ),
        Stack(children: [
          AnimatedPositioned(
              bottom: mainScreenActive ? 0 : -100,
              left: addButtonActive
                  ? MediaQuery.of(context).size.width / 2 + 44
                  : MediaQuery.of(context).size.width / 2 - 28,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: ActionButton(
                  icon: MyFlutterApp.check,
                  onClick: null,
                  visible: addButtonActive)),
          AnimatedPositioned(
              bottom: mainScreenActive ? 0 : -100,
              left: MediaQuery.of(context).size.width / 2 - 28,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: AnimatedActionButton(
                  icon: MyFlutterApp.plus,
                  turns: addButtonActive ? 0.125 : 0,
                  onClick: addButtonClick)),
        ])
      ]),
      bottomNavigationBar:
          CustomTabBar(currentTab: selectedTab, tabClick: changeSelectedTab),
    );
  }
}
