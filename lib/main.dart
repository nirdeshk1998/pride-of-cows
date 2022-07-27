import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/screens/gift_card/gift_card_screen.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/screens/orders/orders_screen.dart';
import 'package:poc/screens/splash/splash_screen.dart';
import 'package:poc/styles/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialPalette.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.latoTextTheme(),
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      localizationsDelegates: const [CountryLocalizations.delegate],
      home: const SplashScreen(),
    );
  }
}
