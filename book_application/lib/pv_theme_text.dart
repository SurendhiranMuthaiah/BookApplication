import 'package:book_application/data_theme_list.dart';
import 'package:book_application/display_theme_text.dart';
import 'package:book_application/drawer_navigation.dart';
import 'package:flutter/material.dart';

class PVThemeText extends StatefulWidget {
  const PVThemeText({Key? key}) : super(key: key);

  @override
  State<PVThemeText> createState() => _PVThemeTextState();
}

class _PVThemeTextState extends State<PVThemeText> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: Text('Thems'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            height: 250,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                controller: PageController(
                  viewportFraction: 0.7,
                ),
                itemCount: themeList.length,
                itemBuilder: (context, index) {
                  var theme = themeList[index];
                  var _scale = _selectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: DisplayThemeText(appData: theme),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: new Text(
                  (_selectedIndex + 1).toString() +
                      '/' +
                      themeList.length.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
