import 'package:flutter/material.dart';

import 'package:disenos_app/src/pages/pinterest_page.dart';

// import 'package:disenos_app/src/pages/slideshow_page.dart';
//import 'package:disenos_app/src/labs/slidesshow_labs.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/headers_page.dart';
//import 'package:disenos_app/src/labs/circular_progress_page.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: PinterestPage(),
    );
  }
}


