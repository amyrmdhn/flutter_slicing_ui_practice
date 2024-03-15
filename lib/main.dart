import 'package:flutter/material.dart';
import 'package:flutter_slicing_ui_practice/widgets/item_service_coffee.dart';
import 'package:google_fonts/google_fonts.dart';

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  background: const Color.fromARGB(255, 214, 214, 215),
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slicing UI Practice'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
              child: ItemServiceCoffee(
                titleText: 'Casual Hot Coffee',
                descriptionText: 'Kopi enak dan mantap nih bosku.',
              ),
            )
          ],
        ),
      ),
    );
  }
}
