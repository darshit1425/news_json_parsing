import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/news_screen/provider/news_provider.dart';
import 'screen/news_screen/view/news_screnn.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => News_Provider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '6',
        routes: {
          // '/': (context) => Albums(),
          '/': (context) => News_Screen(),

        },
      ),
    ),
  );
}
