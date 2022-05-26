import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white))),
      home: ScreenMainPage(),
    );
  }
}
