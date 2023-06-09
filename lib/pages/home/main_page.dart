import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/home/chat_page.dart';
import 'package:flutter_application_1/pages/home/wishlist_page.dart';
import 'package:flutter_application_1/pages/home/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/cart-icon.png',
          width: 20,
          color: Colors.white,
        ),
      );
    }

    Widget customButtomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: warnabgareaproyek,
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_home.png',
                        width: 21,
                        color: currentIndex == 0
                            ? primaryColor
                            : Color(0xff808191),
                      )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10, right: 45),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                      color:
                          currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10, left: 45),
                    child: Image.asset(
                      'assets/icon_wishlist.png',
                      width: 19,
                      color:
                          currentIndex == 2 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color:
                          currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();

        case 1:
          return ChatPage();

        case 2:
          return WishlistPage();

        case 3:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: warnabgproyek,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtomNav(),
      body: body(),
    );
  }
}
