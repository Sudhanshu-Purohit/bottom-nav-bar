import 'package:bottom_nav_bar/page/cart_page.dart';
import 'package:bottom_nav_bar/page/favourite_page.dart';
import 'package:bottom_nav_bar/page/notification_page.dart';
import 'package:bottom_nav_bar/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;


class HomePage extends StatelessWidget {

  HomePage({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen(BuildContext context) {
    return const [ NotificationPage(), CartPage(), FavouritePage() ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Consumer<CounterProvider>(builder: (context, value, child) => Text(value.notification.toString())),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.yellow
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -12),
          child: const Icon(Icons.notifications_none),
        ),
        title: ("Notifications"),
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: CupertinoColors.black,
      ),


      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Consumer<CounterProvider>(builder: (context, value, child) => Text(value.cart.toString())),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.yellow
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -18),
          child: const Icon(CupertinoIcons.cart),
        ),
        title: ("Cart"),
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: CupertinoColors.black,
      ),


      PersistentBottomNavBarItem(
        icon: badges.Badge(
          badgeContent: Consumer<CounterProvider>(builder: (context, value, child) => Text(value.favourite.toString())),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.yellow
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -16),
          child: const Icon(Icons.favorite_outline),
        ),
        title: ("Favourite"),
        activeColorPrimary: Colors.purple,
        inactiveColorPrimary: CupertinoColors.black,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context, 
        controller: _controller,
        screens: _buildScreen(context),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style3,
        backgroundColor: const Color.fromARGB(255, 143, 205, 255),
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // colorBehindNavBar: Colors.white
        ),
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
        ),
      ),
    );
  }
}