import 'package:flutter/material.dart';
import 'package:online_gallery/presentation/pages/detail_page.dart';

import 'pages/gallery_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Color(0xFFE75743),
        primaryColor: Color(0xFFDB2804),
        fontFamily: "Montserrat",
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailsPage.routeName: (context) => DetailsPage(),
      },
    );
  }
}
