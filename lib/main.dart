import 'package:disenos_app/src/models/layout_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:disenos_app/src/pages/launcher_page_tablet.dart';
import 'package:disenos_app/src/theme/them_changer.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';

//import 'package:disenos_app/src/pages/slider_list_page.dart';
//import 'package:disenos_app/src/pages/emergency_page.dart';
// import 'package:disenos_app/src/pages/pinterest_page.dart';
// import 'package:disenos_app/src/pages/slideshow_page.dart';
//import 'package:disenos_app/src/labs/slidesshow_labs.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_app/src/pages/headers_page.dart';
//import 'package:disenos_app/src/labs/circular_progress_page.dart';
//import 'package:disenos_app/src/pages/graficas_circulares_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel())
    ],
    child: const MyApp(),
  ));
}

// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (_) => ThemeChanger(2), child: const MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: OrientationBuilder(builder: (BuildContext context, orientation) {
        final screenSize = MediaQuery.of(context).size;
        if (screenSize.width > 500) {
          return const LauncherPageTablet();
        } else {
          return const LauncherPage();
        }
      }),
    );
  }
}
