import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_egitim/View/basari_takip.dart';
import 'package:test_egitim/View/hedef.dart';
import 'package:test_egitim/View/kariyer_rehper.dart';
import 'package:test_egitim/View/profil.dart';
import 'package:test_egitim/View/dash_board.dart';

void main() => runApp(const MenuPage());

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return  [
      KariyerRehper(),
      Hedef(),
      DashBoard(),
      BasariTakip(),
      Profil(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _navBarItem(FontAwesomeIcons.briefcase, "Kariyer"),
      _navBarItem(FontAwesomeIcons.bullseye, "Hedef"),
      _navBarItem(FontAwesomeIcons.house, "Portföy"),
      _navBarItem(FontAwesomeIcons.listCheck, "Gelişim"),
      _navBarItem(FontAwesomeIcons.user, "Profil"),
    ];
  }

  PersistentBottomNavBarItem _navBarItem(IconData icon, String title) {
    return PersistentBottomNavBarItem(
      icon: Icon(icon),
      title: title,
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        margin: EdgeInsets.symmetric(horizontal: mediaHeight * 0.01),
        navBarHeight: 55.0,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineToSafeArea: true,
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        navBarStyle: NavBarStyle.style9,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 500),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
      ),
    );
  }
}
