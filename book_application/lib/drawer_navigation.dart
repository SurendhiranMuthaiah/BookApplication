import 'package:book_application/pv_quotes_text.dart';
import 'package:book_application/pv_theme_text.dart';
import 'package:book_application/pv_word_text.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Brian Tracy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              'Version 1.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('asset/brian-about.jpg'),
            ),
          ),
          ListTile(
            title: const Text('Quotes'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PVQuotesText()));
            },
          ),
          ListTile(
            title: const Text('Themes'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PVThemeText()));
            },
          ),
          ListTile(
            title: const Text('Words'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PVWordText()));
            },
          ),
        ],
      ),
    );
  }
}
