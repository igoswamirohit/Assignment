import 'package:assignment/detail_page.dart';
import 'package:assignment/home_page.dart';
import 'package:assignment/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (_) => NewsProvider(),
      child: MaterialApp(
        title: 'DRC Systems Assignment',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
                headline6: GoogleFonts.dancingScript(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))),
        home: Home(),
        routes: {
          'detailPage': (context) => DetailPage(),
        },
      ),
    );
  }
}
