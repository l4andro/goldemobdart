import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 85, 37, 130), // Cor do Lakers (roxo)
    primary: const Color.fromARGB(255, 231, 231, 8),
    secondary: Colors.white,
    onBackground: Colors.black, // Cor do texto sobre o background roxo do Lakers
  ),
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 53, 15, 88), // Cor do Lakers (roxo)
    primary: Color.fromARGB(255, 177, 186, 3),
    secondary: Color.fromARGB(255, 234, 234, 230),
    onBackground: Color.fromARGB(255, 0, 0, 0), // Cor do texto sobre o background roxo do Lakers
  ),
);
