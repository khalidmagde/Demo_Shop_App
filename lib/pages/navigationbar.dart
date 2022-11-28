import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/tap_to_favorite.dart';
import 'package:mega_store_tr/profile/profile_screen.dart';

import 'Fav_page.dart';
import 'home_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  List<Widget> widgetPages = [
    HomePage(),
    ProfileScreen(),
    FavoritePage(),
    FavoritePage(),
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.account_circle_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Offer',
            icon: Icon(Icons.local_offer),
          ),
          BottomNavigationBarItem(
            label: 'Fav',
            icon: Icon(Icons.favorite_border_rounded),
          ),
        ],
      ),
      body: widgetPages.elementAt(selectedindex),
    );
  }
}
