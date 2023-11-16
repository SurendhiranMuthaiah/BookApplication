import 'package:book_application/data_theme_list.dart';
import 'package:flutter/material.dart';

class DisplayThemeText extends StatelessWidget {
  final ThemeList appData;

  const DisplayThemeText({Key? key, required this.appData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          letterSpacing: 2.5,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Center(
              child: Text(
                appData.theme,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
