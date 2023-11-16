import 'package:book_application/data_quotes_list.dart';
import 'package:book_application/display_quotes_text.dart';
import 'package:book_application/drawer_navigation.dart';
import 'package:flutter/material.dart';

class PVQuotesText extends StatefulWidget {
  const PVQuotesText({Key? key}) : super(key: key);

  @override
  State<PVQuotesText> createState() => _PVQuotesTextState();
}

class _PVQuotesTextState extends State<PVQuotesText> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Quotes'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text('Share'),
              ),
            ],
            elevation: 5,
            onSelected: (value) {},
          ),
        ],
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
                itemCount: quotesList.length,
                itemBuilder: (context, index) {
                  var quote = quotesList[index];
                  var _scale = _selectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 350),
                      child: DisplayQuotesText(
                        appData: quote,
                      ),
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
                      quotesList.length.toString(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
